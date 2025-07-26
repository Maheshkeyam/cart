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
    libmagickwand-dev --no-install-recommends

# Configure GD
RUN docker-php-ext-configure gd --with-freetype --with-jpeg

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
