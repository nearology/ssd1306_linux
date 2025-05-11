CC ?= gcc
CFLAGS ?= -Wall -Werror -I.
LDFLAGS ?= -static

OBJS := main.o ssd1306.o linux_i2c.o
BIN := ssd1306_bin

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f *.o *.d $(BIN)
