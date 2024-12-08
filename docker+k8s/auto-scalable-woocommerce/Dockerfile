FROM wordpress:php8.0-apache

# Install unzip and curl
RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install WooCommerce plugin and other required plugins/themes
RUN curl -o /tmp/woocommerce.zip -fSL https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip && \
    unzip /tmp/woocommerce.zip -d /usr/src/wordpress/wp-content/plugins/ && \
    rm /tmp/woocommerce.zip

# Install any additional plugins or themes (example: Storefront theme)
RUN curl -o /tmp/storefront.zip -fSL https://downloads.wordpress.org/theme/storefront.latest-stable.zip && \
    unzip /tmp/storefront.zip -d /usr/src/wordpress/wp-content/themes/ && \
    rm /tmp/storefront.zip

# Set necessary permissions
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/

# Copy custom WooCommerce configurations or files if needed
# ADD custom-woocommerce-config.php /usr/src/wordpress/wp-content/plugins/woocommerce/includes/

# Expose the default Apache port
EXPOSE 80
