# Use the official lightweight Nginx image
FROM nginx:latest

# Set a directory for the SSL files and copy them into the container
COPY ssl /etc/nginx/ssl

# Copy static website files to the default Nginx HTML directory
COPY app /usr/share/nginx/html

# Replace the default Nginx configuration with a custom one for SSL
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Ensure correct permissions for the SSL certificates
RUN chmod 600 /etc/nginx/ssl/*

# Expose HTTP (80) and HTTPS (443) ports
EXPOSE 80 443

# Use the default Nginx command to start the server
CMD ["nginx", "-g", "daemon off;"]

