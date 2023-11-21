FROM wordpress:latest

# Install xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install Less for WP-CLI
RUN apt-get update && apt-get -y install less

# Install wp-cli
RUN apt-get update && apt-get install -y sudo less mariadb-client
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /bin/wp-cli.phar
RUN cd /bin && mv wp-cli.phar wp
RUN mkdir -p /var/www/.wp-cli/cache && chown www-data:www-data /var/www/.wp-cli/cache

# replace stock plugins/themes with our own
RUN rm -rf /var/www/html/wp-content/{plugins,themes}
COPY --chown=www-data:www-data ./src /var/www/html/wp-content
