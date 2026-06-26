# ziemiomierstwo
Przewodnik po geometrii nowej i nowej.

Narzędzie do poprawiania składni dokumentu dwujęzykowego:
```
fiks() {
    perl -pi -e 's/^(\s*)\\pol\{(.*?)\}$/$1$2 % lang-pl/; s/^(\s*)\\ita\{(.*?)\}$/$1$2 % lang-it/' "$1";
}

fuks() {
    next_geo_file="$(rg -il 'eksperymentalne tłumaczenie na włoski' | xargs wc -c | grep src/ | shuf -n 3 | sort -g | tail -n 2 | head -n 1  | awk '{print $2}')";
    echo "next_geo_file = ${next_geo_file}";

    git show "$(git tree --follow -- ${next_geo_file} | fzf | awk '{print $2}'):${next_geo_file}" > /tmp/geometry.tex;
    
    code "${next_geo_file}" /tmp/geometry.tex;
}
```