FROM php:8.3-apache
LABEL maintainer="Lydiah Nganga"

RUN docker-php-ext-install mysqli
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin/
RUN sed -i "s/\r$//" /usr/local/bin/start-apache && chmod +x /usr/local/bin/start-apache && a2enmod rewrite

COPY html /var/www
RUN chown -R www-data:www-data /var/www

EXPOSE 80
CMD ["start-apache"]
