# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: peerdb <peerdb@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/19 17:13:57 by peerdb         #+#    #+#                 #
#    Updated: 2020/03/20 12:59:22 by peerdb        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

FLAGS = -Wall -Werror -Wextra
ifdef DEBUG
 FLAGS += -g -fsanitize=address
endif

SRC_DIR = src/

SRC = hello.s

OBJ = $(SRC%.s=%.o)

%.o : %.s
	nasm -f elf64 $< -o $@

$(NAME): $(addprefix $(SRC_DIR), $(OBJ))
	ar -rcs $(NAME) $^

clean:
	rm -rf $(addprefix $(SRC_DIR), $(OBJ))

fclean: clean
	rm $(NAME)

re: fclean all
