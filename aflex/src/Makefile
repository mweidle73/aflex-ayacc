TARGET = aflex
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin

all: $(TARGET)

$(TARGET):
	gnatmake $@

clean:
	gnatclean $(TARGET)

install: $(TARGET)
	install -v -m 755 -D $(TARGET) $(DESTDIR)/$(BINDIR)/$(TARGET)

.PHONY: all clean install
