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
MARIADB_DATA_PATH=$(DATA_PATH)/mariadb
WORDPRESS_DATA_PATH=$(DATA_PATH)/wordpress

all: dir up

build: docker compose -f $(DOCKER_COMPOSE_PATH) up -d --build

up: docker compose -f $(DOCKER_COMPOSE_PATH) up -d

down: docker compose -f $(DOCKER_COMPOSE_PATH) down

rebuild:
	down
	mkdir -p $(MARIADB_DATA_PATH)
	mkdir -p $(WORDPRESS_DATA_PATH)
	build

clean: down
	docker system prune -a
	rm -rf $(MARIADB_DATA_PATH)
	rm -rf $(WORDPRESS_DATA_PATH)

fclean: down
	docker system prune -afv
	docker volume prune -f
	docker network prune -f
	rm -rf $(MARIADB_DATA_PATH)
	rm -rf $(WORDPRESS_DATA_PATH)

PHONY.: all build up down rebuild clean fclean
