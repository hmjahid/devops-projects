# Use the official WordPress image as the base
FROM wordpress:latest

# Install necessary packages, including unzip
RUN apt-get update && apt-get install -y \
    unzip \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Install WooCommerce plugin
RUN curl -o /tmp/woocommerce.zip -L https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip && \
    unzip /tmp/woocommerce.zip -d /usr/src/wordpress/wp-content/plugins/ && \
    rm /tmp/woocommerce.zip

# Set proper permissions
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins/woocommerce

# Expose the WordPress port
EXPOSE 80
