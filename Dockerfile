FROM ghcr.io/siwatinc/nginx-pagespeed:latest
RUN apt-get update && apt-get -y install mariadb-server && echo '[server]' >> /etc/mysql/my.cnf && echo 'datadir=/config/database' >> /etc/mysql/my.cnf
RUN rm -v /initializer/initialize-builtin.sh
ADD ./initialize-builtin.sh /initializer/initialize-builtin.sh
ADD ./initializedb.sql /initializer/initializedb.sql
CMD chmod +x /initializer/initialize-builtin.sh && /initializer/initialize-builtin.sh && service php7.3-fpm start && nginx