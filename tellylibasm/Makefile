# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: abobas <abobas@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/04/29 01:21:34 by abobas        #+#    #+#                  #
#    Updated: 2020/04/30 14:49:43 by abobas        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

MAN_OBJ = 	ft_strlen.o \
			ft_strcpy.o \
			ft_strcmp.o \
			ft_write.o \
			ft_read.o \
			ft_strdup.o

BON_OBJ =	ft_atoi_base_bonus.o \
			ft_list_push_front_bonus.o \
			ft_list_size_bonus.o \
			ft_list_sort_bonus.o \
			ft_list_remove_if_bonus.o

ifdef WITH_BONUS
OBJ_FILES = $(MAN_OBJ) $(BON_OBJ)
else
OBJ_FILES = $(MAN_OBJ)
endif

FLAGS = -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(OBJ_FILES)
	ar rcs $(NAME) $(OBJ_FILES)

%.o: %.s
	nasm -f macho64 -o $@ $<

bonus: 
	$(MAKE) WITH_BONUS=1 all

test_bonus: fclean bonus
	gcc $(FLAGS) test_bonus.c -L. -lasm -o test_bonus
	./test_bonus

test: re
	gcc $(FLAGS) test.c -L. -lasm -o test
	./test

clean:
	rm -rf $(MAN_OBJ) $(BON_OBJ)

fclean: clean
	rm -rf $(NAME) test test_bonus

re:	fclean all