upstream frontend {
    server {{ hostvars['frontend'].ansible_host }};
}

upstream backend {
    server {{ hostvars['backend'].ansible_host }};
}

server {
    listen 80;

    location = (/|/frontend) {
        rewrite ^/frontend(.*) /$1 break;        
        proxy_pass http://frontend;
        proxy_set_header Host $host;
    }

    location /backend {
        rewrite ^/backend(.*) /$1 break;
        proxy_pass http://backend;
        proxy_set_header Host $host;
    }
}