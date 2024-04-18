# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/26 17:36:03 by xmatute-          #+#    #+#              #
#    Updated: 2024/04/13 20:37:35 by xmatute-         ###   ########.fr        #
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

# copiar script de inicio

COPY ./tools/init.sql /tmp/init.sql

#init db

# no sé si esto puede ir en RUN o si es necesario que sea en CMD o ENTRYPOINT 
RUN service mysql start && \
    mysql -u root < /tmp/init.sql && \
    rm /tmp/init.sql && \
    service mysql stop

# iniciar servicio

ENTRYPOINT [ "mysqld" ]
CMD [ "--bind-address=0.0.0.0" ]