# Use the official WordPress image as the base
FROM wordpress:latest

# Install WooCommerce plugin
RUN apt-get update && \
    apt-get install -y unzip && \
    curl -o /tmp/woocommerce.zip -L https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip && \
    unzip /tmp/woocommerce.zip -d /usr/src/wordpress/wp-content/plugins/ && \
    rm /tmp/woocommerce.zip && \
    chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins/

# Set permissions
RUN chmod -R 755 /usr/src/wordpress/wp-content/plugins/

# Expose port
EXPOSE 80

# Start the container
CMD ["apache2-foreground"]
