TARGET = aflex
PREFIX = /bin
DESTDIR = /usr/local

all: $(TARGET)

$(TARGET):
	gnatmake $@

clean:
	gnatclean $(TARGET)

install: $(TARGET)
	install -v -m 755 -D $(TARGET) $(DESTDIR)/$(PREFIX)/$(TARGET)

.PHONY: all clean install
