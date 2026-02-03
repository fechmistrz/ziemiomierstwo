#!/usr/bin/env bash

random_chapter="$(echo {01..12} 99 | tr ' ' '\n' | shuf -n 1)"

git ls-files '*.tex' | grep -E "${random_chapter}" | \
    while read f; do
        d="$(git log -1 --format=%ct -- "$f")"
        echo "${d} ${f}"
    done | gawk '
    BEGIN {
        now = systime()
        min_age = 7 * 86400
    }
    {
        age = now - $1
        if (age < min_age) next;
        sum += age
        files[NR] = $2
        weights[NR] = age
    }
    END {
        if (sum == 0) exit 1
        r = rand() * sum
        for (i in files) {
            r -= weights[i]
            if (r <= 0) {
                print files[i]
                exit
            }
        }
    }'
