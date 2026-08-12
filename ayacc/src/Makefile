TARGET = ayacc
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
SOURCES = $(wildcard *.adb *.ads)

all: $(TARGET)

$(TARGET): $(SOURCES)
	gnatmake $@

check: $(TARGET)
	../tests/check-external-template "$(CURDIR)/$(TARGET)"

clean:
	gnatclean $(TARGET)

install: $(TARGET)
	install -v -m 755 -D $(TARGET) $(DESTDIR)/$(BINDIR)/$(TARGET)

.PHONY: all check clean install
