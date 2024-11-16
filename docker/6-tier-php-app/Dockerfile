# Use PHP with Apache
FROM php:8.0-apache

# Install necessary extensions for MySQLi and Redis
RUN docker-php-ext-install mysqli \
    && pecl install redis \
    && docker-php-ext-enable redis

# Set the working directory
WORKDIR /var/www/html

# Copy application code into the container
COPY ./app /var/www/html

# Set the Apache document root (optional)
ENV APACHE_DOCUMENT_ROOT=/var/www/html

# Update Apache configuration to reflect document root change
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Enable Apache mod_rewrite if needed
RUN a2enmod rewrite
