# Use the WordPress PHP 8.2 FPM version as the base image
FROM wordpress:php8.2-fpm

# Install NGINX and unzip for WooCommerce plugin
RUN apt-get update && \
    apt-get install -y nginx unzip curl && \
    curl -o /tmp/woocommerce.zip -L https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip && \
    unzip /tmp/woocommerce.zip -d /var/www/html/wp-content/plugins/ && \
    rm /tmp/woocommerce.zip && \
    chown -R www-data:www-data /var/www/html/wp-content/plugins/

# Remove Apache since we are using NGINX
RUN apt-get remove -y apache2 && apt-get autoremove -y

# Set correct ownership and permissions for WordPress files
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Copy the NGINX configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose HTTP port for the container (port 80)
EXPOSE 80

# Start PHP-FPM and NGINX
CMD ["bash", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
