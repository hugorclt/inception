FROM alpine:3.16

RUN 	apt update && apt install mysql mysql-client

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/createDatabase.sh ~/createDatabase.sh

CMD		["sh", "~/createDatabase.sh"]