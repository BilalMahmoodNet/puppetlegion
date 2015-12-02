sudo -i 

#edit apt source list
echo '# Zabbix Application PPA'  >> /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/tbfr/zabbix/ubuntu precise main'  >> /etc/apt/sources.list 
echo 'deb-src http://ppa.launchpad.net/tbfr/zabbix/ubuntu precise main'  >> /etc/apt/sources.list 

#add ppa key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C407E17D5F76A32B

#install zabbix
debconf-set-selections <<< 'mysql-server mysql-server/root_password password netbuilder'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password netbuilder'
apt-get update
apt-get install -y zabbix-server-mysql php5-mysql zabbix-frontend-php


#configure zabbix
sed -i "s/# DBPassword=.*/DBPassword=netbuilder/" /etc/zabbix/zabbix_server.conf

#configure mysql
cd /usr/share/zabbix-server-mysql/
gunzip *.gz

mysql -u root -pnetbuilder << EOF 
create user 'zabbix'@'localhost' identified by 'netbuilder';
create database zabbix;
grant all privileges on zabbix.* to 'zabbix'@'localhost';
flush privileges;
exit;
EOF

mysql -u zabbix -pnetbuilder zabbix < schema.sql
mysql -u zabbix -pnetbuilder zabbix < images.sql
mysql -u zabbix -pnetbuilder zabbix < data.sql

#configure php
sed -i 's/post_max_size = 8m.*/post_max_size = 16m/' /etc/php5/apache2/php.ini
sed -i 's/max_execution_time = 30.*/max_execution_time = 200/' /etc/php5/apache2/php.ini
sed -i 's/max_input_time = 60.*/max_input_time = 300/' /etc/php5/apache2/php.ini
sed -i 's/;date.timezone =.*/date.timezone = UTC/' /etc/php5/apache2/php.ini

cp /usr/share/doc/zabbix-frontend-php/examples/zabbix.conf.php.example /etc/zabbix/zabbix.conf.php

sed -i 's/$DB['PASSWORD'] =.*/$DB['PASSWORD'] = netbuilder/' /etc/zabbix/zabbix.conf.php

#configure additional files
mkdir /etc/apache2/conf.d
cp /usr/share/doc/zabbix-frontend-php/examples/apache.conf /etc/apache2/conf.d/zabbix.conf
a2enmod alias
service apache2 restart
sed -i 's/Start=no.*/Start=yes/' /etc/default/zabbix-server
service zabbix-server start
cp /usr/share/doc/zabbix-frontend-php/examples/apache.conf /etc/apache2/conf-available/zabbix.conf
a2enconf zabbix.conf
service apache2 reload
