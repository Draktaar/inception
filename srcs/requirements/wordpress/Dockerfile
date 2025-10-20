# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achu <achu@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/30 12:24:28 by achu              #+#    #+#              #
#    Updated: 2025/10/20 16:40:08 by achu             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install php php-fpm php-mysql curl -y

COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./tools/script.sh /

RUN php -v

RUN chmod +x /script.sh

CMD ["/script.sh"]