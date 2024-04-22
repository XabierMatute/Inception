# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/26 17:36:03 by xmatute-          #+#    #+#              #
#    Updated: 2024/04/22 12:51:31 by xmatute-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

# Etiqueta del mantenedor
LABEL maintainer="xmatute- <xmatute-@student.42.fr>"

# Exponer puerto
EXPOSE 3306

# instalar mariadb
RUN apt -y update && \
    apt -y install mariadb-server mariadb-client

# 
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /run/mysqld/mysqld.sock

# copiar script de inicio

COPY ./tools/init.sh  /tmp/init.sh
#y darle permisos de ejecucion
RUN chmod +x /tmp/init.sh

# iniciar servicio

CMD [ "/tmp/init.sh" ]