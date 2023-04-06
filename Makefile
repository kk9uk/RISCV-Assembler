SRC := $(shell find . -name "*.c")
TGT := asm
OPT := -Wall -std=c99 -Wno-return-type -O3 # -Werror
VAL := tools/validate.sh

.default: all

all: asm

$(TGT): $(SRC)
	$(CC) $(OPT) $^ -o $@

validate: $(TGT)
	bash $(VAL)

.PHONY: clean
clean:
	rm -f asm *.bin
