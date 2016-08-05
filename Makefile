include app.conf
all: clone build up
clone:
	rm -rf src; git clone --recursive $(gitrepo) -b $(gitbranch) src; \
	cp config/_settings.py src/firefist/firefist/;

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

start:
	docker-compose start

stop:
	docker-compose stop

restart:
	docker-compose restart

pull:
	cd src; git pull;

# restart-app:
# 	docker exec -t -i $(app_container) supervisorctl restart \
# 	portal:* soap-http soap-https celery

# code-pull:
# 	cd src; echo "$(date) - $(git rev-parse HEAD)" >> ../git.history; \
# 	git pull; git submodule update

# update: code-pull restart-app

# shell:
# 	docker exec -ti $(app_container) bash

# shell-mysql:
# 	docker exec -t -i $(mysql_container) bash
