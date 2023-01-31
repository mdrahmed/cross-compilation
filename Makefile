CLANG=clang++-14
CPP_file=gcd.cpp
Objects=ex ex-arm32

all: ex-x86-64 ex-arm32

ex-x86-64: $(CPP_file)
	$(CLANG) $< -o $@
ex-arm32: $(CPP_file)
	$(CLANG) --target=arm-linux-gnueabihf $< -o $@ ## generating ex for arm32

.PHONY: clean
clean:
	rm $(Objects)
