\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{greaseproof}[2024/08/28]
\LoadClass[9pt, twoside]{extbook}

\RequirePackage[
	paperwidth=6.125in,
	paperheight=9.25in,
	left=0.6in,
	right=0.6in,
	top=0.8in,
	bottom=0.8in,
	twoside,
	% showframe,
	headsep=0.2in,
]{geometry}

\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage{tikz}

\RequirePackage[usenames, svgnames, table]{xcolor}
\RequirePackage{calc}
\RequirePackage{changepage}
\RequirePackage[toc]{appendix}
\RequirePackage{etoolbox}

\RequirePackage{float}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[final]{microtype}

\RequirePackage{Alegreya}

\RequirePackage{fontspec}
\RequirePackage[polish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[final]{microtype}

\RequirePackage{polski}

\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[C]{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyhead[LE]{\thepage}
\fancyhead[CE]{$\mathcal{L}$emiałgiusz z Hornšperku}
\fancyhead[RE]{}
\fancyhead[LO]{}
\fancyhead[CO]{Almanach geometryczny}
\fancyhead[RO]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.0pt}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

\theoremstyle{plain}
\newcounter{counter}
\numberwithin{counter}{section}
\newtheorem{conjecture}[counter]{Hipoteza}
\newtheorem{geoconstruction}[counter]{Konstrukcja}
\newtheorem{exercise}[counter]{Ćwiczenie}
\newtheorem{integral}[counter]{Całka}
\newtheorem{corollary}[counter]{Wniosek}
\newtheorem{definition}[counter]{Definicja}
\newtheorem{problem}[counter]{Problem}
\newtheorem{example}[counter]{Przyk\l{}ad}
\newtheorem{axiom}[counter]{Aksjomat}
\newtheorem{lemma}[counter]{Lemat}
\newtheorem{proposition}[counter]{Fakt}
\newtheorem{theorem}[counter]{Twierdzenie}
\newtheorem{warning}[counter]{Uwaga}
\newtheorem{tobedone}[counter]{Wymaga przeredagowania}

\theoremstyle{plain}
\newtheorem*{euclidelement}{Element Euklidesa}

% https://tex.stackexchange.com/questions/22012/hyperref-and-imakeidx-do-not-work-together
\RequirePackage{imakeidx}

\RequirePackage[pdfusetitle]{hyperref}
% add [backref] for links from bib entries to citations
% add [pdfusetitle] for metadata
\hypersetup{
    colorlinks,
    linkcolor={darkblue},
    citecolor={darkblue},
    urlcolor={darkblue}
}

\RequirePackage{tkz-euclide}
\RequirePackage{subcaption}

\RequirePackage{makeidx}
\patchcmd{\theindex}{\MakeUppercase\indexname}{\sffamily\normalsize\bfseries\indexname}{}{}
\makeindex[title=Skorowidz]
\makeindex[name=persons,title=Indeks osób]

\definecolor{ocre}{RGB}{105, 180, 255}
\colorlet{darkblue}{ocre!80!black}

% \usepackage[subtle]{savetrees}

\RequirePackage{titlesec}

\RequirePackage{lipsum}
\RequirePackage{comment}
% \includecomment{comment}
\RequirePackage{tikz}
\RequirePackage{paralist}
\usetikzlibrary{calc}

\newcommand{\loremipsum}{ {\color{gray}  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nisl purus, ultricies et ante quis, iaculis imperdiet justo. Proin tristique turpis a tortor eleifend lobortis. Vestibulum odio nisi, tempor sed scelerisque ac, aliquet a lorem. Proin ullamcorper nibh eget augue placerat lobortis. Quisque ac commodo libero, fringilla dictum purus. Proin nec massa vitae lorem eleifend lacinia. Praesent rhoncus ultricies ullamcorper. Fusce vel viverra purus, nec rhoncus massa. Etiam nisl lorem, cursus vel est sit amet, mattis venenatis magna. Vestibulum id risus sit amet nisi congue ultrices id nec ex. } }
\newcommand{\todofoot}[1]{\textcolor{red}{\textbf{(!)}\footnote{\textbf{\color{red}{Do zrobienia}}: #1}}}