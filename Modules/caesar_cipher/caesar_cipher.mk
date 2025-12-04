CC = gcc
CFLAGS = -I$(INC_DIR)
LINKER_FLAGS = -lm

INC_DIR = ./inc/
SRC_DIR = ./src/
OBJ_DIR = ../../Application/out/gen/
LIBS_DIR = ../../Application/out/libs/
OBJ_FILES = $(OBJ_DIR)caesar_encrypt.o $(OBJ_DIR)caesar_decrypt.o

all: $(OBJ_FILES)
	ar -cr $(LIBS_DIR)caesar_lib.a $(OBJ_FILES)

$(OBJ_DIR)caesar_encrypt.o: $(SRC_DIR)caesar_encrypt.c
	$(CC) -c $< $(CFLAGS) -o $@

$(OBJ_DIR)caesar_decrypt.o: $(SRC_DIR)caesar_decrypt.c
	$(CC) -c $< $(CFLAGS) -o $@

.PHONY: all
