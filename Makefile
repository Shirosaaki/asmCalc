##
## EPITECH PROJECT, 2024
## make
## File description:
## make
##

NAME	=	my_bc

SRC		=	main.asm		\
			putchar.asm		\
			putnbr.asm		\
			getnbr.asm		\
			getlennbr.asm	\

OBJ		=	$(SRC:.asm=.o)

all: $(OBJ)
	ld -o $(NAME) $(OBJ)

%.o: %.asm
	nasm -f elf64 $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
