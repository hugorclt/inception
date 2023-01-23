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

clean		:
				docker-compose -f requirements/docker-compose.yml down -v