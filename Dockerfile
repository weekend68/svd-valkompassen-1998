FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y apache2 perl && rm -rf /var/lib/apt/lists/*
RUN a2enmod cgid

# Låt Apache läsa PORT-miljövariabeln (satt av Railway)
RUN echo 'export PORT=${PORT:-80}' >> /etc/apache2/envvars \
    && sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf \
    && sed -i 's/<VirtualHost \*:80>/<VirtualHost *:${PORT}>/' /etc/apache2/sites-enabled/000-default.conf

COPY val98/ /usr/lib/cgi-bin/val98/
RUN chmod 755 /usr/lib/cgi-bin/val98/valguide.pl \
              /usr/lib/cgi-bin/val98/analys.pl \
    && touch /usr/lib/cgi-bin/val98/val98.log \
    && chmod 666 /usr/lib/cgi-bin/val98/val98.log
COPY apache-val98.conf /etc/apache2/conf-available/val98.conf
RUN a2enconf val98
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
