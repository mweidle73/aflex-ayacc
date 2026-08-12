TARGET = aflex
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
SOURCES = $(wildcard *.adb *.ads)

all: $(TARGET)

$(TARGET): $(SOURCES)
	gnatmake $@

clean:
	gnatclean $(TARGET)

install: $(TARGET)
	install -v -m 755 -D $(TARGET) $(DESTDIR)/$(BINDIR)/$(TARGET)

check: $(TARGET)
	../tests/check-external-templates ./$(TARGET)

.PHONY: all check clean install
