FROM php:8.2.12-fpm

RUN apt-get update && apt-get install -y \
   libpng-dev libonig-dev libxml2-dev zip unzip git curl libzip-dev \
   libjpeg-dev libfreetype6-dev \
   && docker-php-ext-configure gd --with-freetype --with-jpeg \
   && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /var/www/html
COPY . /var/www/html

RUN chown -R www-data:www-data storage bootstrap/cache
#https://laravel.com/docs/12.x/deployment#configuration-and-cache Directory permissions

CMD ["php-fpm"]


