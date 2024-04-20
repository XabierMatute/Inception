# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/26 19:49:51 by xmatute-          #+#    #+#              #
#    Updated: 2024/04/20 18:50:17 by xmatute-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

# Etiqueta del mantenedor
LABEL maintainer="xmatute- <xmatute-@student.42.fr>"

# instalar nginx

RUN apt -y update && \
    apt -y install nginx && \
    apt -y install openssl

# generar certificado ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=ES/ST=Vizcaya/L=Urduliz/O=42/OU=42Urduliz/CN=xmatute-42.fr"

# copiar configuracion

COPY ./conf/default.conf /etc/nginx/sites-available/default
