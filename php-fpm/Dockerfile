# php-fpm/Dockerfile
FROM php:8.4-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libxslt-dev \
    libpq-dev \
    zlib1g-dev \
    libjpeg62-turbo-dev \
    libmagickwand-dev \
    libwebp-dev \
    --no-install-recommends

# Configure GD to include WebP support
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp

# Install PHP extensions (only those that need to be compiled)
RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    curl \
    dom \
    exif \
    fileinfo \
    gd \
    intl \
    mbstring \
    mysqli \
    opcache \
    pcntl \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    simplexml \
    xml \
    xsl \
    calendar\
    zip

# Optional: install Imagick (for image manipulation)
RUN pecl install imagick && docker-php-ext-enable imagick

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Adjust PHP-FPM configuration for Bagisto (optional, but good practice)
# Increase memory limit and execution time
RUN echo "memory_limit = ${PHP_MEMORY_LIMIT:-512M}" > /usr/local/etc/php/conf.d/memory-limit.ini \
    && echo "upload_max_filesize = 100M" >> /usr/local/etc/php/conf.d/upload-limit.ini \
    && echo "post_max_size = 100M" >> /usr/local/etc/php/conf.d/upload-limit.ini \
    && echo "max_execution_time = 300" >> /usr/local/etc/php/conf.d/execution-time.ini \
    && echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/timezone.ini \
    && echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_NOTICE" >> /usr/local/etc/php/conf.d/error-reporting.ini # Disable deprecated and notice warnings

# Clear cache
RUN rm -rf /var/cache/apk/*

EXPOSE 9000
CMD ["php-fpm"]