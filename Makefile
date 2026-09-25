CC       := gcc
CFLAGS   := -Wall -Wextra -I./include
LDFLAGS  := -L./lib -Wl,-rpath,'$$ORIGIN/../lib'
LIBS     := -lmyutils

PREFIX      ?= /usr/local
EXEC_PREFIX ?= $(PREFIX)
BINDIR      ?= $(EXEC_PREFIX)/bin
LIBDIR      ?= $(EXEC_PREFIX)/lib
INCLUDEDIR  ?= $(PREFIX)/include
MANDIR      ?= $(PREFIX)/share/man/man3

BIN_DIR  := bin
OBJ_DIR  := obj
LIB_DIR  := lib
MAN_DIR  := man/man3

TARGET     := $(BIN_DIR)/client_dynamic
SHARED_LIB := $(LIB_DIR)/libmyutils.so

.PHONY: all clean setup build_src install uninstall

all: setup build_src $(TARGET)

build_src:
	$(MAKE) -C src

$(TARGET): build_src | setup
	$(CC) $(OBJ_DIR)/main.o $(LDFLAGS) $(LIBS) -o $@
	@echo "Build successful: $@"

setup:
	mkdir -p $(BIN_DIR) $(OBJ_DIR) $(LIB_DIR)

install: all
	@echo "Installing MyUtils dynamic executable, shared library, headers, and man pages..."
	# 1. Create target system directories
	install -d $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(LIBDIR)
	install -d $(DESTDIR)$(INCLUDEDIR)
	install -d $(DESTDIR)$(MANDIR)

	# 2. Install executable and shared library (.so only)
	install -m 755 $(TARGET) $(DESTDIR)$(BINDIR)/
	install -m 755 $(SHARED_LIB) $(DESTDIR)$(LIBDIR)/

	# 3. Install header files
	install -m 644 include/*.h $(DESTDIR)$(INCLUDEDIR)/

	# 4. Install groff man pages
	install -m 644 $(MAN_DIR)/*.3 $(DESTDIR)$(MANDIR)/

	@echo "Installation complete!"

uninstall:
	@echo "Uninstalling MyUtils..."
	rm -f $(DESTDIR)$(BINDIR)/client_dynamic
	rm -f $(DESTDIR)$(LIBDIR)/libmyutils.so
	rm -f $(DESTDIR)$(INCLUDEDIR)/myfilefunctions.h
	rm -f $(DESTDIR)$(INCLUDEDIR)/mystrfunctions.h
	rm -f $(DESTDIR)$(MANDIR)/mycat.3
	rm -f $(DESTDIR)$(MANDIR)/mygrep.3
	rm -f $(DESTDIR)$(MANDIR)/mystrcat.3
	rm -f $(DESTDIR)$(MANDIR)/mystrcmp.3
	rm -f $(DESTDIR)$(MANDIR)/mystrlen.3
	rm -f $(DESTDIR)$(MANDIR)/wordCount.3
	@echo "Uninstallation complete!"

clean:
	$(MAKE) -C src clean
	rm -rf $(BIN_DIR)/* $(OBJ_DIR)/*.o $(LIB_DIR)/*.so