CC      := gcc
CFLAGS  := -Wall -Wextra -I../include
AR      := ar
ARFLAGS := rcs

# Target Directories (relative to src/)
OBJ_DIR := ../obj
LIB_DIR := ../lib

# Static Library Target
LIB_TARGET := $(LIB_DIR)/libmyutils.a

# All source files in src/
SRCS     := main.c myfilefunctions.c mystrfunctions.c
# All object files mapped to ../obj/
OBJS     := $(patsubst %.c, $(OBJ_DIR)/%.o, $(SRCS))

# Objects required for the static library (latter two)
LIB_OBJS := $(OBJ_DIR)/myfilefunctions.o $(OBJ_DIR)/mystrfunctions.o

.PHONY: all clean

all: $(OBJS) $(LIB_TARGET)

# Archive the two utility object files into libmyutils.a
$(LIB_TARGET): $(LIB_OBJS) | $(LIB_DIR)
	$(AR) $(ARFLAGS) $@ $^

# Rule to compile any .c file in src/ to ../obj/%.o
$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Create output directories if they don't exist
$(OBJ_DIR) $(LIB_DIR):
	mkdir -p $@

clean:
	rm -f $(OBJS) $(LIB_TARGET)