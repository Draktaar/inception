# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achu <achu@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/28 16:41:16 by achu              #+#    #+#              #
#    Updated: 2025/08/28 16:41:16 by achu             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE_PATH=./srcs/docker-compose.yml
DATA_PATH= $(HOME)/data
MARIADB_DATA_PATH=$(DATA_PATH)/mysql
WORDPRESS_DATA_PATH=$(DATA_PATH)/wordpress

all: dir up

rebuild: down dir build

build:
	docker compose -f $(DOCKER_COMPOSE_PATH) up -d --build

up:
	docker compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	docker compose -f $(DOCKER_COMPOSE_PATH) down

dir:
	mkdir -p $(MARIADB_DATA_PATH)
	mkdir -p $(WORDPRESS_DATA_PATH)

clean: down
	docker system prune -a
	sudo rm -rf $(MARIADB_DATA_PATH)
	sudo rm -rf $(WORDPRESS_DATA_PATH)

fclean: down
	docker system prune -af
	docker volume prune -f
	docker network prune -f
	sudo rm -rf $(MARIADB_DATA_PATH)
	sudo rm -rf $(WORDPRESS_DATA_PATH)

PHONY.: all build up down rebuild dir clean fclean
