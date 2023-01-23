sleep 10

#Check if wp-config exist to not relaunch the config script everytime we launch the container
if ! [ -f "/var/www/wordpress/wp-config.php" ]; then
	wp config create	--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress' \
						--allow-root \
	&& wp core install	--title="hrecolet.42.fr" \
						--url="hrecolet.42.fr" \
						--path='/var/www/wordpress' \
						--admin_user="hrecolet" \
						--admin_password=$WORDPRESS_ADMIN_PWD \
						--admin_email="hrecolet@student.42.fr" \
						--skip-email \
						--allow-root \
	&& wp user create	author author@example.com \
						--path='/var/www/wordpress' \
						--role=author \
						--user_pass=$WORDPRESS_USER_PWD \
						--allow-root
fi

#Check if /run/php exist to prevent an error from php
if ! [ -d "/run/php" ]; then
	mkdir /run/php
fi

exec /usr/sbin/php-fpm7.3 --nodaemonize

