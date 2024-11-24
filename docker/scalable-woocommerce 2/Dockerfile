# Use official PHP image with Apache
FROM php:8.1-apache

# Install necessary PHP extensions and utilities
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

# Enable Apache modules
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Download and install WordPress
RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz \
    && cp -R wordpress/* /var/www/html/ \
    && rm -rf wordpress latest.tar.gz

# Install WooCommerce plugin
RUN curl -L -o woocommerce.zip https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip \
    && unzip woocommerce.zip -d wp-content/plugins/ \
    && rm woocommerce.zip

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
