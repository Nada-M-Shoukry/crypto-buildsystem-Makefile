#===================================================================================================
# Name        : Makefile Project
# Copyright   : Edges For Training
# Description : A Makefile to compile and link a modular program with separate source files for 
#               simple and complex operations. It organizes include directories, source directories,
#               and builds the final executable. This is just a template you can start with your
#				own Makefile (remember makefile names: Makefile - Name.mk - Name < make -f Name >)
#===================================================================================================

CC = gcc

# Main Directories
APP_DIR = .
ROOT_DIR = $(APP_DIR)/..
MODULES_DIR = $(ROOT_DIR)/Modules

# Modules Directories
CAESAR_CIPHER_DIR = $(MODULES_DIR)/caesar_cipher
XOR_CIPHER_DIR = $(MODULES_DIR)/xor_cipher

# Application Directories
APP_OUT_DIR = $(APP_DIR)/out
APP_OBJ_DIR = $(APP_OUT_DIR)/gen
APP_LIBS_DIR = $(APP_OUT_DIR)/libs
APP_BIN = $(APP_OUT_DIR)/output

# Modules Source files
CAESAR_CIPHER_SRC = $(CAESAR_CIPHER_DIR)/src/caesar_encrypt.c \
                    $(CAESAR_CIPHER_DIR)/src/caesar_decrypt.c
XOR_CIPHER_SRC = $(XOR_CIPHER_DIR)/src/xor_encrypt.c \
                 $(XOR_CIPHER_DIR)/src/xor_decrypt.c

# Modules Library files
CAESAR_CIPHER_LIB = $(APP_LIBS_DIR)/caesar_lib.a
XOR_CIPHER_LIB = $(APP_LIBS_DIR)/libxor_lib.so

# Application Source files
APP_SRC = $(APP_DIR)/app.c

# Application Object files
APP_OBJ = $(APP_OBJ_DIR)/app.o

LIBS_FILES = $(APP_LIBS_DIR)/caesar_lib.a $(APP_LIBS_DIR)/libxor_lib.so
OUTPUT_FILE = $(APP_DIR)/output
LINKER_FLAGS = -L$(APP_LIBS_DIR) -lxor_lib -lm
CFLAGS = -I$(CAESAR_CIPHER_DIR)/inc -I$(XOR_CIPHER_DIR)/inc

all: $(OUTPUT_FILE)

$(OUTPUT_FILE): $(APP_OUT_DIR) $(APP_OBJ_DIR) $(APP_LIBS_DIR) $(APP_OBJ) $(LIBS_FILES)
	$(CC) $(APP_OBJ) $(CAESAR_CIPHER_LIB) $(LINKER_FLAGS) -o $@


$(APP_OUT_DIR):
	@mkdir -p $@

$(APP_LIBS_DIR):
	@mkdir -p $@

$(APP_OBJ_DIR):
	@mkdir -p $@

$(APP_OBJ): $(APP_SRC) $(APP_OBJ_DIR)
	$(CC) -c $< $(CFLAGS) -o $@

$(CAESAR_CIPHER_LIB): $(CAESAR_CIPHER_DIR) $(APP_LIBS_DIR)
	make -C $< -f caesar_cipher.mk all

$(XOR_CIPHER_LIB): $(XOR_CIPHER_DIR) $(APP_LIBS_DIR)
	make -C $< -f xor_cipher.mk all


clean:
	rm -rf $(APP_OUT_DIR) $(OUTPUT_FILE) $(APP_LIBS_DIR) $(APP_GEN_DIR)


.PHONY: all clean
