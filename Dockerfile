FROM nextcloud:latest

# Обновляем пакеты и устанавливаем системные зависимости Samba
RUN apt-get update && apt-get install -y \
    smbclient \
    libsmbclient \
    libsmbclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Компилируем PHP-расширение smbclient и активируем его
RUN pecl install smbclient && docker-php-ext-enable smbclient
