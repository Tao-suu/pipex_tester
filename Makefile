# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbez--du <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/27 09:32:38 by tbez--du          #+#    #+#              #
#    Updated: 2025/12/05 21:05:19 by tbez--du         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC	= main.c \
	  env.c \
	  exec_in.c \
	  exec_out.c \
	  destroy.c \
	  utils.c \
	  exec_mid.c
OBJ	= $(SRC:.c=.o)

LIB	= -Lft_printf -lftprintf -Llibft -lft
INC	= -Ift_printf -Ilibft

CC	= cc
CF	= -Wall -Werror -Wextra -g3
CCF	= $(CC) $(CF)

NAME	= pipex

LIBFT	= libft/libft.a
PRINTF	= ft_printf/libftprintf.a


all: $(NAME)

$(NAME): $(PRINTF) $(LIBFT) $(OBJ)
	$(CCF) $(OBJ) -o $(NAME) $(LIB)

$(LIBFT):
	$(MAKE) -C libft -s
	
$(PRINTF):
	$(MAKE) -C ft_printf -s

%.o: %.c
	$(CCF) -c $< -o $@ $(INC)

clean:
	rm -f $(OBJ)
	$(MAKE) clean -C ft_printf -s
	$(MAKE) clean -C libft -s

fclean: clean
	rm -f $(NAME)
	rm -f $(PRINTF)
	rm -f $(LIBFT)

re: fclean all

bonus: all

.PHONY: all clean fclean re
