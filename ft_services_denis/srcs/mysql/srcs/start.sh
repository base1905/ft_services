openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < createdb.sql
# mysql -u root arannara < arannara.sql
rc-service mariadb stop
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'