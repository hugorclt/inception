all			:	build

build		:
				docker-compose -f requirements/docker-compose.yml build

start		:
				docker-compose -f requirements/docker-compose.yml start

up			:
				docker-compose -f requirements/docker-compose.yml up

stop		:
				docker-compose -f requirements/docker-compose.yml stop

purge		:
				docker system prune -af
				sudo rm -rf /Users/hrecolet/data/mariadb
				sudo rm -rf /Users/hrecolet/data/wordpress

re 			:
				make purge
				sudo mkdir -p /Users/hrecolet/data/mariadb
				sudo mkdir -p /Users/hrecolet/data/wordpress

clean		:
				docker-compose -f requirements/docker-compose.yml down -v