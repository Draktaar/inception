# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achu <achu@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/30 12:24:28 by achu              #+#    #+#              #
#    Updated: 2025/09/29 02:22:06 by achu             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt-get update -y && apt upgrade -y && apt install nginx -y && apt install openssl -y

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD [ "/script.sh" ]