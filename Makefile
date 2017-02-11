PYTHON := python
MD5 := md5sum -c --quiet

2bpp     := $(PYTHON) gfx.py 2bpp
1bpp     := $(PYTHON) gfx.py 1bpp
pcm      := $(PYTHON) extras/pokemontools/pcm.py pcm
pic      := $(PYTHON) extras/pokemontools/pic.py compress
includes := $(PYTHON) extras/pokemontools/scan_includes.py

objs := \
	audio.o \
	main.o \
	text.o \
	wram.o

markov_objs := $(objs:.o=_markov.o)

$(foreach obj, $(objs:.o=), \
	$(eval $(obj)_dep := $(shell $(includes) $(obj).asm)) \
)

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .pic .wav .pcm
.SECONDEXPANSION:
# Suppress annoying intermediate file deletion messages.
.PRECIOUS: %.2bpp %.png
.PHONY: all clean chatty debug

rom := chatty.gbc
debug := chatty_debug.gbc

all: $(rom) $(debug)
chatty: $(rom)

tidy:
	rm -f $(rom) $(debug) $(objs) $(markov_objs) $(rom:.gbc=.sym) $(debug:.gbc=.sym)

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' -o -iname '*.pcm' \) -exec rm {} +

%.asm: ;
$(objs): %.o: %.asm $$(%_dep)
	rgbasm -h -o $@ $*.asm

$(markov_objs): %_markov.o: %.asm $$(%_dep)
	rgbasm -D MARKOV -h -o $@ $*.asm

opts = -cjsv -k 01 -l 0x33 -m 0x1b -p 0 -r 03 -t "TPP_CHATTYYLLW"

$(rom): $(markov_objs)
	rgblink -n $*.sym -o $@ $^
	rgbfix $(opts) $@

$(debug): $(objs)
	rgblink -n $*.sym -o $@ $^
	rgbfix $(opts) $@

%.png:  ;
%.2bpp: %.png  ; @$(2bpp) $<
%.1bpp: %.png  ; @$(1bpp) $<
%.pic:  %.2bpp ; @$(pic)  $<

%.wav: ;
%.pcm: %.wav   ; @$(pcm)  $<
