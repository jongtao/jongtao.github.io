EXEC=./togif.sh

SRC=$(wildcard *.tex)
OUT=$(SRC:.tex=.png)

all: $(OUT)

%.png: %.tex
	$(EXEC) $<

.PHONY: clean
clean:
	rm *.png
