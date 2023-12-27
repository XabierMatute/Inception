# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/22 19:55:46 by xmatute-          #+#    #+#              #
#    Updated: 2023/12/27 18:05:00 by xmatute-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


define ASCIIART

▪   ▐ ▄  ▄▄· ▄▄▄ . ▄▄▄·▄▄▄▄▄▪         ▐ ▄ 
██ •█▌▐█▐█ ▌▪▀▄.▀·▐█ ▄█•██  ██ ▪     •█▌▐█
▐█·▐█▐▐▌██ ▄▄▐▀▀▪▄ ██▀· ▐█.▪▐█· ▄█▀▄ ▐█▐▐▌
▐█▌██▐█▌▐███▌▐█▄▄▌▐█▪·• ▐█▌·▐█▌▐█▌.▐▌██▐█▌
▀▀▀▀▀ █▪·▀▀▀  ▀▀▀ .▀    ▀▀▀ ▀▀▀ ▀█▄▀▪▀▀ █▪

endef
export ASCIIART

NAME := Inception

SRC_DIR :=	./srcs

DCYML := $(SRC_DIR)/docker-compose.yml

REQ_DIR :=	$(SRC_DIR)/requirements

MARIADB_DIR := $(REQ_DIR)/mariadb

WHITE = \033[0;37m
RED = \033[0;31m
CYAN = \033[0;36m
GREEN = \033[0;32m
MAGENTA = \033[0;35m

all :
	# docker-compose -f $(DCYML) config
	@echo "making all..."
	docker-compose -f $(DCYML) up --detach
	@echo "$(MAGENTA)$$ASCIIART$(WHITE)"

clean : 
	@echo "$(RED)clean done...$(WHITE)"

fclean : clean
	@echo "$(RED)fclean done...$(WHITE)"

re : fclean all

sani:
	$(MAKE) EFLAGS='$(SANI)' all

flagless:
	$(MAKE) CPPFLAGS='' all

commit:
	git add $(SRC) $(CLASSES_SRC) $(CLASSES_HEADER) $(HEADER) $(HEADERS)  ./Makefile
	git commit -m "commit general de $(NAME)"
	git push
	git status

test:

mari:
	@echo "building $@..."
	docker build -t $@ $(MARIADB_DIR)
	@echo "$(GREEN)$@ builded!$(WHITE)"
	@echo "running $@...\n"
	docker run -it $@ 
	@echo "$(GREEN)$@ runned!$(WHITE)"

.PHONY : all clean fclean re sani flagless normi commit test mari