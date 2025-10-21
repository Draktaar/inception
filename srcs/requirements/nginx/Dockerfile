# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achu <achu@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/30 12:24:28 by achu              #+#    #+#              #
#    Updated: 2025/10/21 03:12:23 by achu             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install nginx openssl -y

COPY ./conf/default.conf /etc/nginx/conf.d/
COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh
RUN mkdir -p /etc/nginx/ssl

ENTRYPOINT ["script.sh"]