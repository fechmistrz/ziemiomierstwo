ifeq ($(shell uname),Darwin)
    SED_INPLACE = sed -i ''
else
    SED_INPLACE = sed -i
endif

# Build the Polish and Italian PDFs at the same time.
MAKEFLAGS += -j2

SOURCES = src/ziemiomierstwo.tex src/ziemiomierstwo.bib src/*.cls src/chapters/*.tex src/chapters/*/*.tex

.PHONY: all pl it clean

all: pl it

pl: ziemiomierstwo.pdf

it: ziemiomierstwo-wloskie.pdf

src/img.jpeg:
	curl --location --output src/img.jpeg https://picsum.photos/600/200
	if ! file src/img.jpeg | grep -q 'JPEG image data'; then echo "Failed to download image."; rm src/img.jpeg || true; exit 1; fi

ziemiomierstwo.pdf: $(SOURCES) src/img.jpeg
	rm -rf src-pl
	cp -R src src-pl
	find src-pl -type f \( -name '*.tex' -o -name '*.bib' \) -print0 | xargs -0 $(SED_INPLACE) '/% lang-it$$/d'
	cd src-pl && lualatex -interaction=nonstopmode ziemiomierstwo.tex && bibtex ziemiomierstwo && lualatex -interaction=nonstopmode ziemiomierstwo.tex && lualatex -interaction=nonstopmode ziemiomierstwo.tex
	cp src-pl/ziemiomierstwo.pdf .
	rm -rf src-pl

ziemiomierstwo-wloskie.pdf: $(SOURCES) src/img.jpeg
	rm -rf src-it
	cp -R src src-it
	find src-it -type f \( -name '*.tex' -o -name '*.bib' \) -print0 | xargs -0 $(SED_INPLACE) '/% lang-pl$$/d'
	$(SED_INPLACE) 's/greaseproof/greaseproofita/g' src-it/ziemiomierstwo.tex
	cd src-it && lualatex -interaction=nonstopmode ziemiomierstwo.tex && bibtex ziemiomierstwo && lualatex -interaction=nonstopmode ziemiomierstwo.tex && lualatex -interaction=nonstopmode ziemiomierstwo.tex
	cp src-it/ziemiomierstwo.pdf ziemiomierstwo-wloskie.pdf
	rm -rf src-it

clean:
	rm -rf src-pl src-it
	rm -f ziemiomierstwo.pdf ziemiomierstwo-wloskie.pdf
