SRCS_PATH				= srcs/
REQS_PATH				= $(SRCS_PATH)requirements/
IMG_TAG					= dev
VOLUME_PATH				= ${HOME}/data

NGINX_PATH				= $(REQS_PATH)nginx/
NGINX_CONTAINER			= nginx
NGINX_IMAGE				= $(NGINX_CONTAINER)

MARIADB_PATH			= $(REQS_PATH)mariadb/
MARIADB_CONTAINER		= mariadb
MARIADB_IMAGE			= $(MARIADB_CONTAINER)
MARIADB_VOLUME			= mariadb-volume
MARIADB_VOLUME_PATH		= $(VOLUME_PATH)/mariadb

WORDPRESS_PATH			= $(REQS_PATH)wordpress/
WORDPRESS_CONTAINER		= wordpress
WORDPRESS_IMAGE			= $(WORDPRESS_CONTAINER)
WORDPRESS_VOLUME		= wordpress-volume
WORDPRESS_VOLUME_PATH	= $(VOLUME_PATH)/wordpress

DOCKER					= docker
IMAGES					= $(DOCKER) images
SYSTEM					= $(DOCKER) system
VOLUME					= $(DOCKER) volume

EDIT					= vim -O

ENV_PATH				= srcs/.env

COMPOSE_PATH			= $(SRCS_PATH)docker-compose.yml
COMPOSE					= docker-compose -f $(COMPOSE_PATH)

all: build

build:
	$(COMPOSE) --env-file $(ENV_PATH) up -d --build

up:
	$(COMPOSE) --env-file $(ENV_PATH) up -d

down:
	$(COMPOSE) down

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs

prune:
	$(SYSTEM) prune -a

volumerm:
	$(VOLUME) rm $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)
	sudo rm -r $(MARIADB_VOLUME_PATH)/* $(WORDPRESS_VOLUME_PATH)/*

images:
	$(IMAGES)
