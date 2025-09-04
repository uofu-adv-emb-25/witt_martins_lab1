CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp


SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)


all: $(OBJS)
%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) $< -S $@

%.o: %.s
	$(AS) $< -o $@

.PHONY: clean
clean:
	rm -f *.i *.o hello.txt
