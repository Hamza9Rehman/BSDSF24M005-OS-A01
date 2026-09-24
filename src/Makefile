CC = gcc
CFLAGS = -Wall -I../include

SRCS = mystrfunctions.c myfilefunctions.c
OBJS = $(SRCS:.c=.o)

all: $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o