FROM 	debian:buster

#Install nginx open SSL
RUN		apt update -y \
		&& apt upgrade -y \
		&& apt install nginx openssl -y

# Create SSL certificates yum https
RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hrecolet.42.fr/UID=hrecolet"

#Copy Nginx configuration file from host to container
RUN		mkdir -p /var/run/nginx
COPY	conf/nginx.conf /etc/nginx/nginx.conf

#Change owner rights
RUN		chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

EXPOSE	443

#Start nginx on foreground
CMD		["nginx", "-g", "daemon off;"]