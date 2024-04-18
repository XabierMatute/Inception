# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/26 19:49:58 by xmatute-          #+#    #+#              #
#    Updated: 2024/04/18 14:00:11 by xmatute-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

# Etiqueta del mantenedor
LABEL maintainer="xmatute- <xmatute-@student.42.fr>"

# Exponer puerto

# MariaDB
EXPOSE 3306
# WordPress
EXPOSE 9000


RUN apt -y update && \
    apt -y install wordpress && \
    apt install php-fpm php-mysql -y && \
    apt -y install curl
    # curl necesario para WP-CLI

COPY tools/init.sh /

ENTRYPOINT [ "/init.sh" ]
