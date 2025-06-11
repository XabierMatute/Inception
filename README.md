# Inception

## Overview

**Inception** is a system administration project that leverages Docker containers to deploy an interconnected service environment. This environment includes a web server powered by Nginx, a MariaDB database, and a WordPress application, all configured to work seamlessly within a virtual network.

## Project Structure

The project is organized into the following components:

## Services

### MariaDB
- A container running a MariaDB database instance.
- Initial configuration is handled via the script [`init.sh`](srcs/requirements/mariadb/tools/init.sh).
- Exposes port `3306`.

### Nginx
- A web server configured to serve WordPress content.
- Automatically generates an SSL certificate for secure communication.
- Configuration is defined in [`default.conf`](srcs/requirements/nginx/conf/default.conf).
- Exposes port `443`.

### WordPress
- A container running a WordPress instance.
- Initial setup is managed via the script [`init.sh`](srcs/requirements/wordpress/tools/init.sh).
- Exposes port `9000`.

## Usage

### Requirements
To run this project, ensure the following tools are installed on your system:
- Docker
- Docker Compose

### Makefile Commands
A Makefile is included to simplify container management:

- `make all`: Builds and starts the containers in detached mode.
- `make clean`: Stops the containers and removes associated volumes.
- `make fclean`: Completely cleans the Docker environment, including volumes and containers.
- `make re`: Rebuilds the project from scratch.

### Environment Variables
The required environment variables for the containers are defined in [`empty.env`](srcs/requirements/tools/empty.env). Make sure to populate this file with the necessary values before running the project.

## Technical Notes
- Data persistence is managed through Docker volumes, as configured in [`docker-compose.yml`](srcs/docker-compose.yml).
- The containers communicate over a virtual network named `MojaveNet`.

## Competencies Demonstrated

This project showcases a range of technical and professional skills:

### Key Skills:
1. **Problem-Solving**: Designing and implementing a complex system using modern tools.
2. **Documentation and Workflow**: Clear and structured project documentation.
3. **Adaptability**: Familiarity with containerization technologies like Docker.

### Technical Expertise:
1. **System Administration**: Setting up and managing interconnected services using Docker containers.
2. **Networking**: Configuration of virtual networks for secure and efficient communication between services.
3. **Automation**: Use of scripts and Makefile commands to streamline deployment and maintenance processes.
4. **Security**: Implementation of SSL certificates for secure web communication.
5. **Database Management**: Configuration and deployment of MariaDB for data persistence.
6. **Web Development**: Deployment of WordPress as a content management system, integrated with Nginx for optimized performance.

## Author
Created by **xmatute-** (<xmatute-@student.42.fr>)