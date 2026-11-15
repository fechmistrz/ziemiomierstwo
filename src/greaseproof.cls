\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{greaseproof}[2026/11/15 Almanach geometryczny (wydanie polskie)]
\LoadClass[10pt, twoside]{extbook}

% Ta klasa ustala tylko język, fonty i napisy.
% Cały wygląd książki jest w greaseproof-common.sty (wspólnym z greaseproofita.cls).

\RequirePackage{amsmath}
\RequirePackage{amsthm}

% Tekst: Alegreya i Alegreya Sans; matematyka: STIX Two Math dopasowany
% wysokością małych liter do Alegreyi.
\RequirePackage{Alegreya}
\RequirePackage{AlegreyaSans}
\RequirePackage{unicode-math}
\setmathfont{STIXTwoMath-Regular.otf}[Scale=MatchLowercase]

\RequirePackage[polish]{babel}
\RequirePackage[nomathsymbols]{polski}
% Polskie znaki nierówności (ze skośną kreską), jak dotąd robił to pakiet polski.
\AtBeginDocument{%
	\let\leq\leqslant \let\le\leqslant
	\let\geq\geqslant \let\ge\geqslant
	% Trójkąt z fontu STIX jest wyższy od wersalików, więc go pomniejszamy; klamry
	% dookoła sprawiają, że dalej działa zapis $S_\triangle$.
	\let\gp@triangle\triangle
	\renewcommand{\triangle}{{\mathchoice
		{\scalebox{0.8}{$\displaystyle\gp@triangle$}}{\scalebox{0.8}{$\textstyle\gp@triangle$}}%
		{\scalebox{0.8}{$\scriptstyle\gp@triangle$}}{\scalebox{0.8}{$\scriptscriptstyle\gp@triangle$}}}}%
}

\newcommand{\gp@str@title}{Almanach geometryczny}
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

\RequirePackage{greaseproof-common}

% Z unicode-math symbole matematyczne w tytułach sekcji psują zakładki PDF.
\pdfstringdefDisableCommands{\def\pi{π}}

\newcommand{\ita}[1]{}
\newcommand{\pol}[1]{#1}
