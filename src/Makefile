CC      := gcc
CFLAGS  := -Wall -Wextra -fPIC -I../include
LDFLAGS := -shared

OBJ_DIR := ../obj
LIB_DIR := ../lib

TARGET  := $(LIB_DIR)/libmyutils.so

SRCS    := main.c myfilefunctions.c mystrfunctions.c
OBJS    := $(patsubst %.c, $(OBJ_DIR)/%.o, $(SRCS))

LIB_OBJS := $(OBJ_DIR)/myfilefunctions.o $(OBJ_DIR)/mystrfunctions.o

.PHONY: all clean

all: $(OBJS) $(TARGET)

$(TARGET): $(LIB_OBJS) | $(LIB_DIR)
	$(CC) $(LDFLAGS) -o $@ $^
	@echo "Dynamic library $@ successfully created!"

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR) $(LIB_DIR):
	mkdir -p $@

clean:
	rm -f $(OBJS) $(TARGET)