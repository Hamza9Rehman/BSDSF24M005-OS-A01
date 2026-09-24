CC       := gcc
CFLAGS   := -Wall -Wextra -I./include
LDFLAGS  := -L./lib -Wl,-rpath,'$$ORIGIN/../lib'
LIBS     := -lmyutils

BIN_DIR  := bin
OBJ_DIR  := obj
LIB_DIR  := lib

TARGET   := $(BIN_DIR)/client_dynamic

.PHONY: all clean setup build_src

all: setup build_src $(TARGET)

build_src:
	$(MAKE) -C src

$(TARGET): build_src | setup
	$(CC) $(OBJ_DIR)/main.o $(LDFLAGS) $(LIBS) -o $@
	@echo "Build successful: $@"

setup:
	mkdir -p $(BIN_DIR) $(OBJ_DIR) $(LIB_DIR)

clean:
	$(MAKE) -C src clean
	rm -rf $(BIN_DIR)/* $(OBJ_DIR)/*.o $(LIB_DIR)/*.so