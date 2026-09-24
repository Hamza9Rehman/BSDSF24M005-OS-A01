CC       := gcc
CFLAGS   := -Wall -Wextra -I./include
LDFLAGS  := -L./lib
LIBS     := -lmyutils

# Target Directories
BIN_DIR  := bin
OBJ_DIR  := obj
LIB_DIR  := lib

TARGET   := $(BIN_DIR)/client_static

.PHONY: all clean setup build_src

all: setup $(TARGET)

# Execute src/Makefile to generate object files and static library
build_src:
	$(MAKE) -C src

# Link main.o with the static library to generate the executable
$(TARGET): $(OBJ_DIR)/main.o $(LIB_DIR)/libmyutils.a | setup
	$(CC) $(OBJ_DIR)/main.o $(LDFLAGS) $(LIBS) -o $@
	@echo "Build successful: $@"

# Ensure dependencies trigger build_src first
$(OBJ_DIR)/main.o $(LIB_DIR)/libmyutils.a: build_src

setup:
	mkdir -p $(BIN_DIR) $(OBJ_DIR) $(LIB_DIR)

clean:
	$(MAKE) -C src clean
	rm -rf $(BIN_DIR)/* $(OBJ_DIR)/*.o $(LIB_DIR)/*.a