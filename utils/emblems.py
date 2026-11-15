#!/usr/bin/env python3
"""Generuje src/greaseproof-emblems.sty: rysunki na strony tytułowe części.

Współrzędne są liczone tutaj, żeby w LaTeX-u zostały same proste ścieżki TikZ
(szybka kompilacja, żadnych zależności od wersji tkz-euclide).

    python3 utils/emblems.py > src/greaseproof-emblems.sty
"""
import cmath
import math


def p(z):
    """Punkt jako para TikZ."""
    if isinstance(z, complex):
        return "(%.3f,%.3f)" % (z.real, z.imag)
    return "(%.3f,%.3f)" % (z[0], z[1])


def circumcenter(a, b, c):
    ax, ay, bx, by, cx, cy = a.real, a.imag, b.real, b.imag, c.real, c.imag
    d = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
    ux = ((ax * ax + ay * ay) * (by - cy) + (bx * bx + by * by) * (cy - ay) + (cx * cx + cy * cy) * (ay - by)) / d
    uy = ((ax * ax + ay * ay) * (cx - bx) + (bx * bx + by * by) * (ax - cx) + (cx * cx + cy * cy) * (bx - ax)) / d
    return complex(ux, uy)


def foot(pt, a, b):
    t = ((pt - a) * (b - a).conjugate()).real / abs(b - a) ** 2
    return a + t * (b - a)


def pons_asinorum():
    """Elementy I.5: kąty przy podstawie trójkąta równoramiennego są równe."""
    A, B, C = complex(0, 4.3), complex(-1.45, 0), complex(1.45, 0)
    D, E = B + 0.62 * (B - A), C + 0.62 * (C - A)
    F, G = B + 0.38 * (B - A), C + 0.38 * (C - A)
    out = [r"\begin{tikzpicture}[x=0.72cm, y=0.72cm, line cap=round, line join=round]"]
    out.append(r"\fill[gppapyrus] %s -- %s -- %s -- cycle;" % (p(A), p(B), p(C)))
    out.append(r"\draw[gpterra, line width=0.7pt] %s -- %s %s -- %s;" % (p(F), p(C), p(G), p(B)))
    out.append(r"\draw[black, line width=0.8pt] %s -- %s %s -- %s %s -- %s;" % (p(A), p(D), p(A), p(E), p(B), p(C)))
    out.append(r"\draw[gpblue, line width=0.5pt] %s -- %s;" % (p(F), p(G)))
    for q in (A, B, C, F, G):
        out.append(r"\fill[black] %s circle [radius=1.5pt];" % p(q))
    out.append(r"\end{tikzpicture}")
    return "\n".join(out)


def nine_point():
    """Okrąg dziewięciu punktów, okrąg wpisany i prosta Eulera."""
    A, B, C = complex(0, 0), complex(7, 0), complex(1.5, 4.0)
    O = circumcenter(A, B, C)
    R = abs(O - A)
    G = (A + B + C) / 3
    H = 3 * G - 2 * O
    N = (O + H) / 2
    a, b, c = abs(B - C), abs(A - C), abs(A - B)
    I = (a * A + b * B + c * C) / (a + b + c)
    area = 0.5 * abs((B - A).real * (C - A).imag - (C - A).real * (B - A).imag)
    r = area / ((a + b + c) / 2)
    fa, fb, fc = foot(A, B, C), foot(B, A, C), foot(C, A, B)
    mids = [(A + B) / 2, (B + C) / 2, (C + A) / 2]
    out = [r"\begin{tikzpicture}[x=0.66cm, y=0.66cm, line cap=round, line join=round]"]
    out.append(r"\draw[black!35, line width=0.5pt] %s circle [radius=%.3f];" % (p(O), R))
    out.append(r"\fill[gppapyrus] %s -- %s -- %s -- cycle;" % (p(A), p(B), p(C)))
    out.append(r"\draw[black!55, line width=0.4pt] %s -- %s %s -- %s %s -- %s;" % (p(A), p(fa), p(B), p(fb), p(C), p(fc)))
    out.append(r"\draw[gpblue, line width=0.7pt] %s circle [radius=%.3f];" % (p(I), r))
    out.append(r"\draw[gpterra, line width=1pt] %s circle [radius=%.3f];" % (p(N), R / 2))
    out.append(r"\draw[black, line width=0.8pt] %s -- %s -- %s -- cycle;" % (p(A), p(B), p(C)))
    e1, e2 = H + (-0.9) * (O - H), H + 2.1 * (O - H)
    out.append(r"\draw[gpterra, line width=0.6pt, dash pattern=on 3pt off 2pt] %s -- %s;" % (p(e1), p(e2)))
    for q in [fa, fb, fc] + mids + [(A + H) / 2, (B + H) / 2, (C + H) / 2]:
        out.append(r"\fill[gpterra] %s circle [radius=1.5pt];" % p(q))
    for q in (O, H, G):
        out.append(r"\fill[black] %s circle [radius=1.3pt];" % p(q))
    out.append(r"\end{tikzpicture}")
    return "\n".join(out)


def invert(center, radius, c, k=1.0):
    d = abs(center - c) ** 2 - radius ** 2
    return c + k * (center - c) / d, abs(k * radius / d)


def steiner_chain(n=8):
    """Poryzm Steinera: zamknięty łańcuch okręgów między dwoma okręgami."""
    s = math.sin(math.pi / n)
    r_in = (1 - s) / (1 + s)
    rho, dist = (1 - r_in) / 2, (1 + r_in) / 2
    c = complex(0.30 * r_in, 0)
    circles = [invert(0j, 1.0, c), invert(0j, r_in, c)]
    chain = [invert(dist * cmath.exp(2j * math.pi * (i + 0.5) / n), rho, c) for i in range(n)]
    # po inwersji większy z dwóch okręgów granicznych jest zewnętrzny; normalizujemy
    outer = max(circles, key=lambda t: t[1])
    scale = 2.75 / outer[1]
    shift = outer[0]
    norm = lambda t: ((t[0] - shift) * scale, t[1] * scale)
    out = [r"\begin{tikzpicture}[x=1cm, y=1cm]"]
    out.append(r"\fill[gppapyrus] %s circle [radius=%.3f];" % (p(norm(outer)[0]), norm(outer)[1]))
    for i, t in enumerate(chain):
        z, r = norm(t)
        fill = "gpterra!38" if i % 2 == 0 else "gpterra!14"
        out.append(r"\filldraw[fill=%s, draw=gpterra, line width=0.6pt] %s circle [radius=%.3f];" % (fill, p(z), r))
    for t in circles:
        z, r = norm(t)
        fill = ", fill=white" if t is not outer else ""
        out.append(r"\draw[draw=black%s, line width=0.8pt] %s circle [radius=%.3f];" % (fill, p(z), r))
    out.append(r"\end{tikzpicture}")
    return "\n".join(out)


def apollonian(max_curv=70.0):
    """Uszczelka Apoloniusza: okręgi styczne wyznaczane wzorem Kartezjusza."""
    circles = {}

    def add(k, z):
        key = (round(k, 4), round(z.real, 4), round(z.imag, 4))
        if key in circles:
            return False
        circles[key] = (k, z)
        return True

    def gen(a, b, c, d):
        # d jest okręgiem stycznym do a, b, c; szukamy drugiego takiego okręgu
        k = 2 * (a[0] + b[0] + c[0]) - d[0]
        if k > max_curv:
            return
        z = (2 * (a[0] * a[1] + b[0] * b[1] + c[0] * c[1]) - d[0] * d[1]) / k
        new = (k, z)
        if not add(k, z):
            return
        gen(a, b, new, c)
        gen(a, c, new, b)
        gen(b, c, new, a)

    outer = (-1.0, 0j)
    c1, c2 = (2.0, complex(0.5, 0)), (2.0, complex(-0.5, 0))
    c3, c4 = (3.0, complex(0, 2 / 3)), (3.0, complex(0, -2 / 3))
    for k, z in (c1, c2, c3, c4):
        add(k, z)
    for quad in ((outer, c1, c3, c2), (outer, c2, c3, c1), (c1, c2, c3, outer),
                 (outer, c1, c4, c2), (outer, c2, c4, c1), (c1, c2, c4, outer)):
        gen(*quad[:3], quad[3])
    S = 2.75
    out = [r"\begin{tikzpicture}[x=1cm, y=1cm]"]
    out.append(r"\fill[gppapyrus] (0,0) circle [radius=%.3f];" % S)
    for k, z in sorted(circles.values(), key=lambda t: t[0]):
        r = S / k
        if k <= 3.5:
            style = "fill=gpterra!32, draw=gpterra, line width=0.6pt"
        elif k <= 16:
            style = "fill=gpterra!16, draw=gpterra, line width=0.45pt"
        else:
            style = "fill=white, draw=gpterra, line width=0.3pt"
        out.append(r"\filldraw[%s] %s circle [radius=%.3f];" % (style, p(z * S), r))
    out.append(r"\draw[black, line width=0.8pt] (0,0) circle [radius=%.3f];" % S)
    out.append(r"\end{tikzpicture}")
    return "\n".join(out)


def icosahedron():
    """Dwudziestościan foremny (Elementy XIII.16) w rzucie prostokątnym."""
    phi = (1 + math.sqrt(5)) / 2
    V = []
    for s1 in (1, -1):
        for s2 in (1, -1):
            V += [(0, s1 * 1, s2 * phi), (s1 * 1, s2 * phi, 0), (s1 * phi, 0, s2 * 1)]
    ax, ay = math.radians(21), math.radians(-27)

    def rot(v):
        x, y, z = v
        y, z = y * math.cos(ax) - z * math.sin(ax), y * math.sin(ax) + z * math.cos(ax)
        x, z = x * math.cos(ay) + z * math.sin(ay), -x * math.sin(ay) + z * math.cos(ay)
        return (x, y, z)

    V = [rot(v) for v in V]
    n = len(V)
    d2 = lambda a, b: sum((a[i] - b[i]) ** 2 for i in range(3))
    edges = [(i, j) for i in range(n) for j in range(i + 1, n) if abs(d2(V[i], V[j]) - 4) < 1e-6]
    adj = set(edges)
    faces = [(i, j, k) for i in range(n) for j in range(i + 1, n) for k in range(j + 1, n)
             if (i, j) in adj and (j, k) in adj and (i, k) in adj]
    light = (-0.45, 0.55, 0.70)
    ln = math.sqrt(sum(c * c for c in light))
    front, shade = set(), {}
    for f in faces:
        c = [sum(V[i][t] for i in f) / 3 for t in range(3)]
        cn = math.sqrt(sum(t * t for t in c))
        nrm = [t / cn for t in c]
        if nrm[2] > 1e-9:
            front.add(f)
            shade[f] = max(0.0, sum(nrm[t] * light[t] / ln for t in range(3)))
    S = 1.45
    q = lambda i: "(%.3f,%.3f)" % (V[i][0] * S, V[i][1] * S)
    out = [r"\begin{tikzpicture}[x=1cm, y=1cm, line cap=round, line join=round]"]
    for i, j in edges:
        if not any(i in f and j in f for f in front):
            out.append(r"\draw[gpterra!70, line width=0.4pt, dash pattern=on 2pt off 1.6pt] %s -- %s;" % (q(i), q(j)))
    for f in sorted(front, key=lambda f: sum(V[i][2] for i in f)):
        tint = int(round(46 - 38 * shade[f]))
        out.append(r"\fill[gpterra!%d, fill opacity=0.92] %s -- %s -- %s -- cycle;" % (tint, q(f[0]), q(f[1]), q(f[2])))
    for i, j in edges:
        if any(i in f and j in f for f in front):
            out.append(r"\draw[black, line width=0.7pt] %s -- %s;" % (q(i), q(j)))
    out.append(r"\end{tikzpicture}")
    return "\n".join(out)


def main():
    emblems = [pons_asinorum(), nine_point(), steiner_chain(), apollonian(), icosahedron()]
    print(r"% Plik wygenerowany przez utils/emblems.py; nie edytuj go ręcznie.")
    print(r"\NeedsTeXFormat{LaTeX2e}")
    print(r"\ProvidesPackage{greaseproof-emblems}[2026/11/15 Almanach geometryczny: emblematy części]")
    print(r"% \gp@emblem{n} rysuje emblemat n-tej części:")
    print(r"%   1 pons asinorum (Elementy I.5), 2 okrąg dziewięciu punktów i prosta Eulera,")
    print(r"%   3 łańcuch Steinera, 4 uszczelka Apoloniusza, 5 dwudziestościan foremny.")
    names = ["i", "ii", "iii", "iv", "v"]
    for name, body in zip(names, emblems):
        print(r"\expandafter\def\csname gp@emblem@%s\endcsname{%%" % name)
        print("\n".join("\t" + line + "%" for line in body.split("\n")))
        print("}")
    print(r"\newcommand{\gp@emblem}[1]{\@ifundefined{gp@emblem@\romannumeral#1}{}{\@nameuse{gp@emblem@\romannumeral#1}}}")
    print(r"\endinput")


if __name__ == "__main__":
    main()
