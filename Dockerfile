FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y apache2 perl && rm -rf /var/lib/apt/lists/*
RUN a2enmod cgid
COPY val98/ /usr/lib/cgi-bin/val98/
RUN chmod 755 /usr/lib/cgi-bin/val98/valguide.pl \
              /usr/lib/cgi-bin/val98/analys.pl \
    && touch /usr/lib/cgi-bin/val98/val98.log \
    && chmod 666 /usr/lib/cgi-bin/val98/val98.log
COPY apache-val98.conf /etc/apache2/conf-available/val98.conf
RUN a2enconf val98
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 80
CMD ["/start.sh"]
