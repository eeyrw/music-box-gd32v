
# toolchain
RISC_GCC_PATH = D:/GNU MCU Eclipse/RISC-V Embedded GCC/8.2.0-2.2-20190521-0004/bin
TOOLCHAIN    = $(RISC_GCC_PATH)/riscv-none-embed-
CC           = $(TOOLCHAIN)gcc
CP           = $(TOOLCHAIN)objcopy
AS           = $(TOOLCHAIN)gcc -x assembler-with-cpp
HEX          = $(CP) -O ihex
BIN          = $(CP) -O binary -S

# define mcu, specify the target processor
ARCH          = rv32imac

# all the files will be generated with this name (main.elf, main.bin, main.hex, etc)
PROJECT_NAME=gd32-gcc-example


# user specific
ASM_SRC   = Synth_rv32.s


OBJECTS  = $(ASM_SRC:.s=.o)

# Define optimisation level here
OPT = -Os

ARCH_FLAGS = -march=$(ARCH)

AS_FLAGS = $(ARCH_FLAGS) -g -gdwarf-2 -Wa,-amhls=$(<:.s=.lst)
#
# makefile rules
#
all: $(OBJECTS)


%.o: %.s
	$(AS) -c $(AS_FLAGS) $< -o $@

clean:
	-rm -rf $(OBJECTS)
	-rm -rf $(ASM_SRC:.s=.lst)

