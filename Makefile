# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: Peer <pde-bakk@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/19 17:13:57 by peerdb        #+#    #+#                  #
#    Updated: 2020/07/22 16:43:39 by pde-bakk      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# for calling conventions on which registers are volatile/non-volatile:
# https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI

NAME = libasm.a

FLAGS = -Wall -Werror -Wextra
ifdef DEBUG
 FLAGS += -g -fsanitize=address
endif

SRC_DIR = src/

SRC =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

OBJ = $(SRC:%.s=%.o)

all: $(NAME)

%.o : %.s
	nasm -fmacho64 $< -o $@

$(NAME): $(addprefix $(SRC_DIR), $(OBJ))
	ar -rcs $(NAME) $^
	@echo "\x1b[35;01mFuck ft_services, all my homies hate ft_services.Serious\
	ly though how the fuck does it only give 9 fucking blackhole days\x1b[0m"

clean:
	rm -rf $(addprefix $(SRC_DIR), $(OBJ))

fclean: clean
	rm -rf $(NAME)

re: fclean all

test: re
	gcc -L . -lasm main.c -o test
	./test
