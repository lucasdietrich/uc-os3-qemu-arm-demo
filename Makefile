# Choose the target to build
# BOARD="netduinoplus2"
# BOARD="lm3s6965evb"
BOARD="mps2_an385"

# Tell if disassembly files should be generated (could take additional time)
DO_DISASSEMBLY=1

all: cmake make

cmake:
	cmake -DCMAKE_TOOLCHAIN_FILE=./toolchain-arm-none-eabi.cmake -DCMAKE_BUILD_TYPE=Debug -DDO_DISASSEMBLY=$(DO_DISASSEMBLY) -DBOARD=$(BOARD) -S . -B build

make:
	make -C build --no-print-directory

qemu: make
	make -C build qemu --no-print-directory

run: make
	make -C build run --no-print-directory

clean:
	rm -rf build