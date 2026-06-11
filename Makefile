all: ziemiomierstwo.pdf

all-italia: ziemiomierstwo-wloskie.pdf

src/img.jpeg:
	curl --location --output src/img.jpeg https://picsum.photos/600/200
	if ! file src/img.jpeg | grep -q 'JPEG image data'; then echo "Failed to download image."; rm src/img.jpeg || true; exit 1; fi

ziemiomierstwo.pdf: src/ziemiomierstwo.tex src/chapters/*.tex src/chapters/*/*.tex src/img.jpeg
	cd src && lualatex ziemiomierstwo.tex && bibtex ziemiomierstwo && lualatex ziemiomierstwo.tex && lualatex ziemiomierstwo.tex
	cp src/ziemiomierstwo.pdf .

ziemiomierstwo-wloskie.pdf: src/ziemiomierstwo.tex src/chapters/*.tex src/chapters/*/*.tex src/img.jpeg
	sed -e 's/poltrue/itatrue/g' -e 's/greaseproof/greaseproofita/g' src/ziemiomierstwo.tex > src/ziemiomierstwo-wloskie.tex
	cd src && lualatex ziemiomierstwo-wloskie.tex && bibtex ziemiomierstwo-wloskie && lualatex ziemiomierstwo-wloskie.tex && lualatex ziemiomierstwo-wloskie.tex
	cp src/ziemiomierstwo-wloskie.pdf .
	rm src/ziemiomierstwo-wloskie.tex

fast: src/ziemiomierstwo.tex src/chapters/*.tex src/chapters/*/*.tex
	cd src && lualatex -interaction=nonstopmode  ziemiomierstwo.tex && bibtex ziemiomierstwo && lualatex -interaction=nonstopmode  ziemiomierstwo.tex && lualatex -interaction=nonstopmode  ziemiomierstwo.tex
	cp src/ziemiomierstwo.pdf .

.PHONY: experimental-all experimental-pl experimental-it experimental-clean

experimental-all: experimental-pl experimental-it

src-pl:
	rm -rf src-pl
	cp -R src src-pl
	find src-pl -type f \( -name '*.tex' -o -name '*.bib' \) -print0 | xargs -0 sed -i '' '/% lang-it$$/d'

src-it:
	rm -rf src-it
	cp -R src src-it
	find src-it -type f \( -name '*.tex' -o -name '*.bib' \) -print0 | xargs -0 sed -i '' '/% lang-pl$$/d'

experimental-pl: src-pl
	cd src-pl && \
	lualatex ziemiomierstwo.tex && \
	bibtex ziemiomierstwo && \
	lualatex ziemiomierstwo.tex && \
	lualatex ziemiomierstwo.tex
	cp src-pl/ziemiomierstwo.pdf ziemiomierstwo-pl.pdf

experimental-it: src-it
	cd src-it && \
	lualatex ziemiomierstwo.tex && \
	bibtex ziemiomierstwo && \
	lualatex ziemiomierstwo.tex && \
	lualatex ziemiomierstwo.tex
	cp src-it/ziemiomierstwo.pdf ziemiomierstwo-it.pdf

experimental-clean:
	rm -rf src-pl src-it
	rm -f ziemiomierstwo-pl.pdf ziemiomierstwo-it.pdf