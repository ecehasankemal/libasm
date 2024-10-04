# Makefile for libasm project
NAME = libasm

# Compiler and assembler settings
CC = gcc
ASM = nasm
ASM_FLAGS = -f elf64
CFLAGS = -Wall -Werror -Wextra
LDFLAGS = -no-pie -z noexecstack

# Directories
MANDATORY_DIR = mandatory

# Source files
ASM_SRCS = $(MANDATORY_DIR)/ft_strlen.asm \
           $(MANDATORY_DIR)/ft_strcpy.asm \
           $(MANDATORY_DIR)/ft_strcmp.asm \
           $(MANDATORY_DIR)/ft_strdup.asm \
           $(MANDATORY_DIR)/ft_write.asm \
           $(MANDATORY_DIR)/ft_read.asm

C_SRCS = main.c

# Object files
ASM_OBJS = $(ASM_SRCS:.asm=.o)
C_OBJS = $(C_SRCS:.c=.o)

# Rules
all: $(NAME)

$(NAME): $(ASM_OBJS) $(C_OBJS)
	$(CC) $(LDFLAGS) -o $(NAME) $(C_OBJS) $(ASM_OBJS)

%.o: %.asm
	$(ASM) $(ASM_FLAGS) -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(ASM_OBJS) $(C_OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
