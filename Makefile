CC = gcc
CFLAGS = -Wall -I./include

.PHONY: all clean

all:
	$(MAKE) -C src
	$(CC) $(CFLAGS) -c src/main.c -o src/main.o
	$(CC) src/main.o src/mystrfunctions.o src/myfilefunctions.o -o ./bin/client

clean:
	$(MAKE) -C src clean
	rm -f *.o ./bin/client