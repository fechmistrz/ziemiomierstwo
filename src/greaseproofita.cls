\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{greaseproofita}[2026/11/15 Almanacco geometrico (edizione italiana)]
\LoadClass[10pt, twoside]{extbook}

% Ta klasa ustala tylko język, fonty i napisy.
% Cały wygląd książki jest w greaseproof-common.sty (wspólnym z greaseproof.cls).

\RequirePackage{amsmath}
\RequirePackage{amsthm}

% Tekst: Palatino (TeX Gyre Pagella) jak dotąd; matematyka z tej samej rodziny.
\RequirePackage{newpxtext}
\RequirePackage{newpxmath}
\RequirePackage{AlegreyaSans}

\RequirePackage[italian]{babel}

\newcommand{\gp@str@title}{Almanacco geometrico}
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

\RequirePackage{greaseproof-common}

\newcommand{\ita}[1]{#1}
\newcommand{\pol}[1]{}
