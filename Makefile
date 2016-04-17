HAXE=haxe

.PHONY: all clean

all: main-raw.lua

clean:
	$(RM) main-raw.lua

main-raw.lua: $(shell find . -name "*.hx")
	$(HAXE) -main Main -lua $@
