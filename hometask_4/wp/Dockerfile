FROM --platform=linux/amd64 ubuntu:latest
RUN apt-get update
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 wget unzip php libapache2-mod-php php-mysql
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN rm /var/www/html/index.html
RUN wget --no-clobber --no-verbose https://wordpress.org/wordpress-5.3.2.zip
RUN unzip -qn wordpress-5.3.2.zip
RUN cp -r wordpress/* /var/www/html
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
