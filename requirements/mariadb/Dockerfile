FROM 	debian:buster

#Install MariaDB
RUN 	apt update -y \
		&& apt upgrade -y \
		&& apt install mariadb-server -y \
		&& apt install mariadb-client -y \
		&& apt install procps -y \
		&& apt install gettext -y

#Copy configuration File from host to container
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#Copy the script that create the database inside the container
COPY	tools/createDatabase.sh /etc/mysql/
COPY	tools/sqlCMD.sql /etc/mysql/

RUN		chmod 777 /etc/mysql/createDatabase.sh

EXPOSE	3306

#Launch Script at startup
CMD		["sh", "/etc/mysql/createDatabase.sh"]
