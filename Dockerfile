# Base PHP com extensões necessárias
FROM php:7.4-apache

ARG RUNTIME_DEPS="mariadb-client git unzip curl libzip-dev libpng-dev libonig-dev libxml2-dev zip"
ENV APACHE_DOCUMENT_ROOT="/var/www/html/public"

# Ativa o módulo rewrite do Apache
RUN a2enmod rewrite

# Instala o Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Define diretório de trabalho
WORKDIR /var/www/html

# Instala extensões e dependências
RUN apt-get update \
    && apt-get install -y --no-install-recommends $RUNTIME_DEPS \
    && docker-php-ext-install pdo pdo_mysql zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Ajuste to docroot VirtualHosts
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf \
    && sed -ri -e 's!<Directory /var/www/>!<Directory ${APACHE_DOCUMENT_ROOT}>!g' /etc/apache2/apache2.conf

# Ativar .htaccess
RUN sed -ri \
    -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
    /etc/apache2/sites-available/000-default.conf && \
    sed -ri \
    -e 's!<Directory /var/www/>!<Directory ${APACHE_DOCUMENT_ROOT}>!g' \
    -e 's!AllowOverride None!AllowOverride All!g' \
    /etc/apache2/apache2.conf

# Copia o restante da aplicação
COPY . .

# Remove cache PHP antigo ANTES de qualquer comando artisan
RUN rm -rf bootstrap/cache/*.php

# Executa o Composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader
RUN ls -la
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Cria script de entrypoint
RUN echo '#!/bin/bash\n\
    set -e\n\
    rm -rf bootstrap/cache/*.php\n\
    rm -rf storage/framework/views/*.php\n\
    php artisan route:clear || true\n\
    php artisan view:clear || true\n\
    php artisan config:clear || true\n\
    php artisan cache:clear || true\n\
    exec "$@"' > /usr/local/bin/docker-entrypoint.sh \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

# Comando padrão (pode ser sobrescrito)
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
