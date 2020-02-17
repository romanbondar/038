FROM --platform=linux/amd64 ubuntu:latest
RUN apt-get update && apt-get install -y mysql-server
RUN sed -i "s/bind-address\t\t= 127.0.0.1/# bind-address\t\t= 127.0.0.1/" /etc/mysql/mysql.conf.d/mysqld.cnf
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld
ENTRYPOINT ["mysqld_safe"]
