#!/bin/bash
PORT=${PORT:-80}
echo "Starting Apache on port $PORT"

# Skriv om ports.conf med rätt port
printf "Listen %s\n" "$PORT" > /etc/apache2/ports.conf

# Uppdatera VirtualHost-porten
sed -i "s/:80>/:${PORT}>/" /etc/apache2/sites-enabled/000-default.conf

# Ladda Apaches miljövariabler (definierar APACHE_RUN_DIR, APACHE_LOG_DIR m.m.)
. /etc/apache2/envvars

# Skapa runtime-kataloger som apache2ctl normalt skapar
mkdir -p "$APACHE_RUN_DIR/socks" "$APACHE_LOCK_DIR" "$APACHE_LOG_DIR"

exec apache2 -D FOREGROUND
