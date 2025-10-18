# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achu <achu@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/28 16:41:16 by achu              #+#    #+#              #
#    Updated: 2025/10/18 17:20:21 by achu             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml
DATA_PATH = /home/achu/data


DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml
DATA_PATH = /home/achu/data

PHONY.: all build up down start stop restart

all: build

build:
	mkdir -p $(DATA_PATH)/mysql
	mkdir -p $(DATA_PATH)/wordpress
	docker compose -f $(DOCKER_COMPOSE_PATH) build

up:
	docker compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	docker compose -f $(DOCKER_COMPOSE_PATH) down

start:
	docker compose -f $(DOCKER_COMPOSE_PATH) start

stop:
	docker compose -f $(DOCKER_COMPOSE_PATH) stop

restart:
	docker compose -f $(DOCKER_COMPOSE_PATH) down
	docker compose -f $(DOCKER_COMPOSE_PATH) up -d

clean:
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v

fclean: clean
	rm -rf $(DATA_PATH)/mysql
	rm -rf $(DATA_PATH)/wordpress
	docker system prune -af