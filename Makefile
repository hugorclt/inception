all			:	build

build		:
				docker-compose -f srcs/docker-compose.yml build

start		:
				docker-compose -f srcs/docker-compose.yml start

up			:
				docker-compose -f srcs/docker-compose.yml up --detach

stop		:
				docker-compose -f srcs/docker-compose.yml stop

purge		:
				docker system prune -af
				sudo rm -rf /Users/hrecolet/data/mariadb
				sudo rm -rf /Users/hrecolet/data/wordpress

re 			:
				make purge
				sudo mkdir -p /Users/hrecolet/data/mariadb
				sudo mkdir -p /Users/hrecolet/data/wordpress
				make build
				make up

clean		:
				docker-compose -f srcs/docker-compose.yml down -v