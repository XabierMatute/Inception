# Inception

## Descripción

Inception es un proyecto de administración de sistemas que utiliza contenedores Docker para implementar un entorno de servicios interconectados. Este entorno incluye un servidor web con Nginx, una base de datos MariaDB y una aplicación WordPress, todos configurados para trabajar juntos en una red virtual.

## Estructura del Proyecto

El proyecto está organizado en la siguiente estructura:

## Servicios

### MariaDB
- Contenedor que ejecuta una base de datos MariaDB.
- Configuración inicial realizada mediante el script [`init.sh`](srcs/requirements/mariadb/tools/init.sh).
- Expone el puerto `3306`.

### Nginx
- Servidor web configurado para servir contenido de WordPress.
- Utiliza un certificado SSL generado automáticamente.
- Configuración definida en [`default.conf`](srcs/requirements/nginx/conf/default.conf).
- Expone el puerto `443`.

### WordPress
- Contenedor que ejecuta una instancia de WordPress.
- Configuración inicial realizada mediante el script [`init.sh`](srcs/requirements/wordpress/tools/init.sh).
- Expone el puerto `9000`.

## Uso

### Requisitos
- Docker y Docker Compose instalados en el sistema.

### Comandos Makefile
El proyecto incluye un Makefile para simplificar la gestión de los contenedores:

- `make all`: Construye y levanta los contenedores en segundo plano.
- `make clean`: Detiene los contenedores y elimina los volúmenes.
- `make fclean`: Limpia completamente el entorno Docker, incluyendo volúmenes y contenedores.
- `make re`: Reconstruye el proyecto desde cero.

### Configuración de Variables de Entorno
Las variables de entorno necesarias para los contenedores están definidas en [`empty.env`](srcs/requirements/tools/empty.env). Asegúrate de completarlas antes de ejecutar el proyecto.

## Notas
- Los volúmenes utilizados para persistencia de datos están configurados en [`docker-compose.yml`](srcs/docker-compose.yml).
- La red virtual utilizada por los contenedores se llama `MojaveNet`.

## Autor
Creado por **xmatute-** (<xmatute-@student.42.fr>)