HAXE=haxe

.PHONY: all clean

all: main-raw.lua

clean:
	$(RM) main-raw.lua

main-raw.lua: $(wildcard *.hx)
	$(HAXE) -main Main -lua $@
