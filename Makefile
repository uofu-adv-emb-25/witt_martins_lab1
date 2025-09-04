CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld



SRC = main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

.PHONY: all

all: firmware.elf

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) $< -S $@

%.o: %.s
	$(AS) $< -o $@

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

.PHONY: clean
clean:
	rm -f *.i *.o hello.txt firmware.elf
