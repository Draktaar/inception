# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achu <achu@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/30 12:24:28 by achu              #+#    #+#              #
#    Updated: 2025/10/21 01:55:11 by achu             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install php php-fpm php-mysql curl -y

COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["script.sh"]