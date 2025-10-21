# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achu <achu@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/28 16:41:16 by achu              #+#    #+#              #
#    Updated: 2025/10/21 02:25:38 by achu             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE_PATH = /home/achu/inception/srcs/docker-compose.yml
DATA_PATH = /home/achu/data

PHONY.: all build up down start stop restart

all: build

build:
	mkdir -p $(DATA_PATH)/mysql
	mkdir -p $(DATA_PATH)/wordpress
	sudo docker compose -f $(DOCKER_COMPOSE_PATH) build

up:
	sudo docker compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	sudo docker compose -f $(DOCKER_COMPOSE_PATH) down

start:
	sudo docker compose -f $(DOCKER_COMPOSE_PATH) start

stop:
	sudo docker compose -f $(DOCKER_COMPOSE_PATH) stop

restart:
	sudo docker compose -f $(DOCKER_COMPOSE_PATH) down
	sudo docker compose -f $(DOCKER_COMPOSE_PATH) up -d

clean:
	sudo docker compose -f $(DOCKER_COMPOSE_PATH) down -v

fclean: clean
	sudo rm -rf $(DATA_PATH)/mysql
	sudo rm -rf $(DATA_PATH)/wordpress
	sudo docker system prune -af
	sudo docker volume prune -f