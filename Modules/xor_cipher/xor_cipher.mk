CC = gcc
CFLAGS = -I$(INC_DIR)
LINKER_FLAGS = -lm

INC_DIR = ./inc/
SRC_DIR = ./src/
OBJ_DIR = ../../Application/out/gen/
LIBS_DIR = ../../Application/out/libs/
OBJ_FILES = $(OBJ_DIR)xor_encrypt.o $(OBJ_DIR)xor_decrypt.o

all: $(OBJ_FILES)
	$(CC) -shared -o $(LIBS_DIR)libxor_lib.so $(OBJ_FILES)
	@sudo cp $(LIBS_DIR)libxor_lib.so /usr/lib

$(OBJ_DIR)xor_encrypt.o: $(SRC_DIR)xor_encrypt.c
	$(CC) -c $< $(CFLAGS) -fpic -o $@

$(OBJ_DIR)xor_decrypt.o: $(SRC_DIR)xor_decrypt.c
	$(CC) -c $< $(CFLAGS) -fpic -o $@

.PHONY: all
