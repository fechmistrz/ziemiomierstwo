\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{greaseproof}[2026/11/15 Almanach geometryczny (wydanie polskie)]
\LoadClass[10pt, twoside]{extbook}

% Ta klasa ustala tylko język, fonty i napisy.
% Cały wygląd książki jest w greaseproof-common.sty (wspólnym z greaseproofita.cls).

\RequirePackage{amsmath}
\RequirePackage{amsthm}

% Tekst: Alegreya z cyframi nautycznymi; matematyka: STIX Two Math dopasowany
% wysokością małych liter do Alegreyi.
\RequirePackage[osf]{Alegreya}
\RequirePackage{unicode-math}
% (W TeX Live sprzed 2021 roku ten sam font nazywa się STIX2Math.otf.)
\IfFontExistsTF{STIXTwoMath-Regular.otf}
	{\setmathfont{STIXTwoMath-Regular.otf}[Scale=MatchLowercase]}
	{\setmathfont{STIX2Math.otf}[Scale=MatchLowercase]}

\RequirePackage[polish]{babel}
\RequirePackage[nomathsymbols]{polski}
% Polskie znaki nierówności (ze skośną kreską), jak dotąd robił to pakiet polski.
\AtBeginDocument{%
	\let\leq\leqslant \let\le\leqslant
	\let\geq\geqslant \let\ge\geqslant
}
\newcommand{\gp@trianglescale}{0.8}

\newcommand{\gp@str@title}{Almanach geometryczny}
\newcommand{\gp@str@titlelines}{Almanach\\geometryczny}
\newcommand{\gp@str@author}{$\mathcal{L}$emiałgiusz z Hornšperku}
\newcommand{\gp@str@pdfauthor}{Lemiałgiusz z Hornšperku}

\newcommand{\gp@str@conjecture}{Hipoteza}
\newcommand{\gp@str@geoconstruction}{Konstrukcja}
\newcommand{\gp@str@exercise}{Ćwiczenie}
\newcommand{\gp@str@integral}{Całka}
\newcommand{\gp@str@corollary}{Wniosek}
\newcommand{\gp@str@definition}{Definicja}
\newcommand{\gp@str@problem}{Problem}
\newcommand{\gp@str@example}{Przykład}
\newcommand{\gp@str@axiom}{Aksjomat}
\newcommand{\gp@str@lemma}{Lemat}
\newcommand{\gp@str@proposition}{Fakt}
\newcommand{\gp@str@theorem}{Twierdzenie}
\newcommand{\gp@str@warning}{Uwaga}
\newcommand{\gp@str@tobedone}{Wymaga przeredagowania}
\newcommand{\gp@str@euclidelement}{Element Euklidesa}
\newcommand{\gp@str@index}{Skorowidz}
\newcommand{\gp@str@persons}{Indeks osób}
\newcommand{\gp@str@todo}{Do zrobienia}
\newcommand{\gp@str@colophon}{Złożono w systemie LuaLaTeX krojami Alegreya\\
	(Juan Pablo del Peral, Huerta Tipográfica) i STIX Two Math.}

\RequirePackage{greaseproof-common}

\newcommand{\ita}[1]{}
\newcommand{\pol}[1]{#1}
