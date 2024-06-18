upstream frontend {
    server {{ hostvars["frontend"].ansible_host }};
}

upstream backend {
    server {{ hostvars["backend"].ansible_host }};
}

server {
    listen 80;

    server_name {{ hostvars["loadbalancer"].ansible_host }};

# URL path followed with / or /frontend will go into this block 
    location ~^(/|/frontend) {
        #so /frontend is not forwarded with the url to frontend server as path location
        rewrite ^/frontend(.*) /$1 break;        
        proxy_pass http://frontend;

        # Pass connection header from initiator to frontend server
        proxy_set_header X-Forwarded-IP $remote_addr;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Port $server_port;
    }

    location /backend {
        rewrite ^/backend(.*) /$1 break;
        proxy_pass http://backend;

        # Pass connection header from initiator to backend
        proxy_set_header X-Forwarded-IP $remote_addr;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Port $server_port;
    }
}