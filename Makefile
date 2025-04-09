_curdirName_=$(notdir $(CURDIR))
CC=gcc
CFLAGS=-O2 -Wall --std=gnu89
SRCS=$(shell ls -F | grep -v "^\." | grep -v "^_" | grep -v "^doc" | grep -v "/$$" | grep "\.c$$")
OBJS=$(SRCS:.c=.o)
TARGET=$(_curdirName_)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $(OBJS) $(LIBS) $(LDFLAGS)

install: all
	mkdir -p $(prefix)
	cp $(TARGET) $(prefix)
	chmod 4750 $(prefix)/$(TARGET)

clean:
	rm -f $(OBJS)
	rm -f $(TARGET)

tags:
	ctags -R ./*.[ch]