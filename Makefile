all: ziemiomierstwo.pdf

all-italia: ziemiomierstwo-wloskie.pdf

src/img.jpeg:
	curl --location --output src/img.jpeg https://picsum.photos/600/200
	if ! file src/img.jpeg | grep -q 'JPEG image data'; then echo "Failed to download image."; rm src/img.jpeg || true; exit 1; fi

ziemiomierstwo.pdf: src/ziemiomierstwo.tex src/chapters/*.tex src/chapters/*/*.tex src/img.jpeg
	cd src && lualatex ziemiomierstwo.tex && bibtex ziemiomierstwo && lualatex ziemiomierstwo.tex && lualatex ziemiomierstwo.tex
	cp src/ziemiomierstwo.pdf .

ziemiomierstwo-wloskie.pdf: src/ziemiomierstwo-wloskie.tex src/chapters/*.tex src/chapters/*/*.tex src/img.jpeg
	cd src && lualatex ziemiomierstwo-wloskie.tex && bibtex ziemiomierstwo-wloskie && lualatex ziemiomierstwo-wloskie.tex && lualatex ziemiomierstwo-wloskie.tex
	cp src/ziemiomierstwo-wloskie.pdf .

fast: src/ziemiomierstwo.tex src/chapters/*.tex src/chapters/*/*.tex
	cd src && lualatex -interaction=nonstopmode  ziemiomierstwo.tex && bibtex ziemiomierstwo && lualatex -interaction=nonstopmode  ziemiomierstwo.tex && lualatex -interaction=nonstopmode  ziemiomierstwo.tex
	cp src/ziemiomierstwo.pdf .