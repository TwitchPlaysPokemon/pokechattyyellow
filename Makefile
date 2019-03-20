PYTHON := python2.7
MD5 := md5sum -c --quiet

2bpp     := $(PYTHON) gfx.py 2bpp
1bpp     := $(PYTHON) gfx.py 1bpp
pcm      := $(PYTHON) extras/pokemontools/pcm.py pcm
pic      := $(PYTHON) extras/pokemontools/pic.py compress
includes := $(PYTHON) extras/pokemontools/scan_includes.py

RGBDS := ./rgbds/rgbasm ./rgbds/rgblink ./rgbds/rgbfix

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

all: assembler $(rom) $(debug)
chatty: assembler $(rom)

tidy:
	rm -f $(rom) $(debug) $(objs) $(markov_objs) $(rom:.gbc=.sym) $(debug:.gbc=.sym)

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' -o -iname '*.pcm' \) -exec rm {} +
	@$(MAKE) -C ./rgbds clean

assembler: $(RGBDS)

$(RGBDS): %:
	@$(MAKE) -C ./rgbds

%.asm: ;
$(objs): %.o: %.asm $$(%_dep) assembler
	./rgbds/rgbasm -o $@ $*.asm

$(markov_objs): %_markov.o: %.asm $$(%_dep)
	./rgbds/rgbasm -D MARKOV -o $@ $*.asm

opts = -cjsv -k 01 -l 0x33 -m 0x1b -p 0 -r 03 -t "TPP_CHATTYYLLW"

$(rom): $(markov_objs)
	./rgbds/rgblink -n $*.sym -o $@ $^
	./rgbds/rgbfix $(opts) $@

$(debug): $(objs)
	./rgbds/rgblink -n $*.sym -o $@ $^
	./rgbds/rgbfix $(opts) $@

%.png:  ;
%.2bpp: %.png  ; @$(2bpp) $<
%.1bpp: %.png  ; @$(1bpp) $<
%.pic:  %.2bpp ; @$(pic)  $<

%.wav: ;
%.pcm: %.wav   ; @$(pcm)  $<
