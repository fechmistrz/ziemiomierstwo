# ziemiomierstwo
Przewodnik po geometrii nowej i nowej.

## Budowanie

`make` buduje obie wersje językowe (`make pl` i `make it` budują jedną).
Potrzebny jest LuaLaTeX z pełnego TeX Live, w tym pakiety `tcolorbox`, `unicode-math`, `titlesec` i `imakeidx` oraz fonty Alegreya, STIX Two Math, TeX Gyre Pagella (pakiet `newpx`) i TeX Gyre Pagella Math.

## Skład

Cały wygląd książki jest w `src/greaseproof-common.sty`.
Klasy `greaseproof.cls` (wersja polska) i `greaseproofita.cls` (włoska) wybierają tylko język, fonty i napisy.

Narzędzie do poprawiania składni dokumentu dwujęzykowego:
```
fiks() {
    perl -pi -e 's/^(\s*)\\pol\{(.*?)\}$/$1$2 % lang-pl/; s/^(\s*)\\ita\{(.*?)\}$/$1$2 % lang-it/' "$1";
}

fuks() {
    next_geo_file="$(rg -il 'eksperymentalne tłumaczenie na włoski' | xargs wc -c | grep src/ | shuf -n 3 | sort -g | tail -n 2 | head -n 1  | awk '{print $2}')";
    echo "next_geo_file = ${next_geo_file}";

    # "git tree" is not a real git subcommand; this uses a graph log so the
    # commit hash lands in the same column ($2) that a "git tree" alias would produce.
    git show "$(git log --graph --oneline --follow -- ${next_geo_file} | fzf | awk '{print $2}'):${next_geo_file}" > /tmp/geometry.tex;
    
    code "${next_geo_file}" /tmp/geometry.tex;
}
```