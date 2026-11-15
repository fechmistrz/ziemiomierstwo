\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{greaseproofita}[2026/11/15 Almanacco geometrico (edizione italiana)]
\LoadClass[10pt, twoside]{extbook}

% Ta klasa ustala tylko język, fonty i napisy.
% Cały wygląd książki jest w greaseproof-common.sty (wspólnym z greaseproof.cls).

\RequirePackage{amsmath}
\RequirePackage{amsthm}

% Tekst: Palatino (TeX Gyre Pagella) z cyframi nautycznymi, jak dotąd;
% matematyka: TeX Gyre Pagella Math, czyli ten sam krój.
\RequirePackage{fontspec}
% Pagella nie ma greki z akcentami ani cyrylicy i takie znaki znikałyby z tekstu
% bez śladu. Brakujące litery bierzemy z Alegreyi (wymaga luaotfload 3.12+).
\newif\ifgp@fallback
\directlua{
	if luaotfload and luaotfload.add_fallback then
		luaotfload.add_fallback("gpfbrm", {"[Alegreya-Regular.otf]:mode=node;"})
		luaotfload.add_fallback("gpfbit", {"[Alegreya-Italic.otf]:mode=node;"})
		luaotfload.add_fallback("gpfbbf", {"[Alegreya-Bold.otf]:mode=node;"})
		luaotfload.add_fallback("gpfbbi", {"[Alegreya-BoldItalic.otf]:mode=node;"})
		tex.sprint("\luaescapestring{\string\gp@fallbacktrue}")
	end
}
\ifgp@fallback
	\setmainfont{TeXGyrePagellaX}[
		Numbers={Proportional,OldStyle},
		UprightFeatures={RawFeature={fallback=gpfbrm}},
		ItalicFeatures={RawFeature={fallback=gpfbit}},
		BoldFeatures={RawFeature={fallback=gpfbbf}},
		BoldItalicFeatures={RawFeature={fallback=gpfbbi}},
	]
\else
	\setmainfont{TeXGyrePagellaX}[Numbers={Proportional,OldStyle}]
\fi
\RequirePackage{unicode-math}
\setmathfont{texgyrepagella-math.otf}
\newcommand{\gp@trianglescale}{0.85}

\RequirePackage[italian]{babel}

\newcommand{\gp@str@title}{Almanacco geometrico}
\newcommand{\gp@str@titlelines}{Almanacco\\geometrico}
\newcommand{\gp@str@author}{$\mathcal{L}$emiaogius di Hornšperk}
\newcommand{\gp@str@pdfauthor}{Lemiaogius di Hornšperk}

\newcommand{\gp@str@conjecture}{Congettura}
\newcommand{\gp@str@geoconstruction}{Costruzione geometrica}
\newcommand{\gp@str@exercise}{Esercizio}
\newcommand{\gp@str@integral}{Integrale}
\newcommand{\gp@str@corollary}{Corollario}
\newcommand{\gp@str@definition}{Definizione}
\newcommand{\gp@str@problem}{Problema}
\newcommand{\gp@str@example}{Esempio}
\newcommand{\gp@str@axiom}{Assioma}
\newcommand{\gp@str@lemma}{Lemma}
\newcommand{\gp@str@proposition}{Fatto}
\newcommand{\gp@str@theorem}{Teorema}
\newcommand{\gp@str@warning}{Avvertenza}
\newcommand{\gp@str@tobedone}{Da rielaborare}
\newcommand{\gp@str@euclidelement}{Elemento di Euclide}
\newcommand{\gp@str@index}{Indice}
\newcommand{\gp@str@persons}{Indice delle persone}
\newcommand{\gp@str@todo}{Da rielaborare}
\newcommand{\gp@str@colophon}{Composto con LuaLaTeX nei caratteri TeX Gyre Pagella\\
	(dal Palatino di Hermann Zapf) e Alegreya (Juan Pablo del Peral).}

\RequirePackage{greaseproof-common}

\newcommand{\ita}[1]{#1}
\newcommand{\pol}[1]{}
