all: ziemiomierstwo.pdf

ziemiomierstwo.pdf: src/ziemiomierstwo.tex src/chapters/*.tex
	cd src && lualatex ziemiomierstwo.tex && bibtex ziemiomierstwo && lualatex ziemiomierstwo.tex && lualatex ziemiomierstwo.tex
	cp src/ziemiomierstwo.pdf .