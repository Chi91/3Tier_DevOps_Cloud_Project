# Choose nginx as webserver for frontend apps
FROM nginx:latest

WORKDIR /app

#Important for nginx webserver to run, all html stuff must be in this folder
COPY . /usr/share/nginx/html

# Expose port 80 for http
EXPOSE 80

# Expose port 443 for https
EXPOSE 443

# Set up a volume for the HTML files (useful for development purposes)
VOLUME ["/var/lib/ui/data"]

# No need to specify CMD as the base nginx image already defines it
