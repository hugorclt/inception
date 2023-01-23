FROM 	debian:buster

#Download wget and php-fpm
RUN 	apt update -y \
		&& apt upgrade -y \
		&& apt install wget php-fpm php-mysql mariadb-client -y

#Download wordpress and dezip it
RUN		mkdir -p /var/www/
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/
RUN		cd /var/www/ && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#Change root owner to write inside /var/www/wordpress
RUN		chown -R root:root /var/www/wordpress

#Copy php config file to container
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d

#Download CLI to configure wordpress
RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#Give the right to the file and move it to the right place
RUN 	chmod +x wp-cli.phar
RUN 	mv wp-cli.phar /usr/local/bin/wp

#Copy the wordpress configuration script inside the container
COPY	tools/auto_config.sh .

EXPOSE	9000

#Run the script at startup
ENTRYPOINT ["/bin/sh", "auto_config.sh"]
