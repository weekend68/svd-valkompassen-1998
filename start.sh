#!/bin/bash
PORT=${PORT:-80}
echo "Starting Apache on port $PORT"

# Skriv om ports.conf med rätt port
printf "Listen %s\n" "$PORT" > /etc/apache2/ports.conf

# Uppdatera VirtualHost-porten
sed -i "s/:80>/:${PORT}>/" /etc/apache2/sites-enabled/000-default.conf

# Ladda Apaches egna miljövariabler (APACHE_LOG_DIR etc.)
. /etc/apache2/envvars

exec apache2 -D FOREGROUND
