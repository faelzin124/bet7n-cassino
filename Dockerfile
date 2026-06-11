FROM ric_harvey/nginx-php-fpm:latest

# Copy application files
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Set permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html/storage
RUN chmod -R 755 /var/www/html/bootstrap/cache

# Copy deploy script
COPY deploy.sh /deploy.sh
RUN chmod +x /deploy.sh

# Expose port
EXPOSE 80

# Run deploy script on startup
CMD ["/deploy.sh"]
