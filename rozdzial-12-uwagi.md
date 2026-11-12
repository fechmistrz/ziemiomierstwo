# Rozdział 12 (geometrie nieeuklidesowe): uwagi do poprawienia

Przegląd treści w `src/chapters/12.tex` i `src/chapters/12-geometrie-nieeuklidesowe/`.
Nie sprawdzano numerów stron Evesa i Hartshorne'a ani rozdziałów 1–11.
Żadne pliki `.tex` nie zostały jeszcze zmienione.

## Błędy

1. **Legendre** (`legendre.tex`): zdanie „Odpowiada to hipotezom Saccheriego, w tej samej kolejności" jest błędne.
   Saccheri: kąt ostry, prosty, rozwarty. Lista Legendre'a: suma > π, = π, < π, czyli rozwarty, prosty, ostry.
   Kolejność jest odwrotna.
2. **Lambert** (`lambert.tex`): „jedenaście lat po śmierci autora" powinno być dziewięć.
   Lambert zmarł w 1777, praca ukazała się w 1786.
3. **Aksjomat Wallisa** (`piaty-postulat.tex`): zdanie „nieprawdziwy w geometrii niearchimedesowej, gdzie istnieją trójkąty podobne o różnych rozmiarach" przeczy samo sobie.
   Aksjomat głosi, że takie trójkąty istnieją, więc jest spełniony w niearchimedesowej płaszczyźnie euklidesowej.
   Zawodzi w geometrii hiperbolicznej, gdzie trójkąty podobne są przystające.
4. **Liczba okresów** (`12.tex` kontra `riemann.tex`): `12.tex` dzieli rozwój na cztery okresy, a `riemann.tex` mówi, że wykład Riemanna „otworzy drugi okres".
   Drugi okres w podziale z `12.tex` to Saccheri, Lambert i Legendre.
   Sformułowanie z `riemann.tex` pochodzi zapewne z dwuokresowego podziału Evesa.
5. **Rok 1829** (`12.tex`, `gauss-bolyai.tex`): zdanie „W 1829 roku Bolyai, Gauss oraz Łobaczewski stworzą geometrię hiperboliczną" nie zgadza się z późniejszym „Ściślej:".
   Bolyai: list do ojca w 1823, publikacja w 1832. Gauss: nic nie opublikował. Łobaczewski: wykład w 1826, druk w 1829–30.
   Nagłówek sekcji „1830 Gauss oraz Farkas i János Bolyai" też nie pasuje do tych dat.
6. **Lemat Proklosa** (`piaty-postulat.tex`): „Zawiera błąd" odnosi się do lematu, ale lemat jest prawdziwy (jest równoważny aksjomatowi Playfaira).
   Błędny jest dowód Proklosa.
   Ponadto Peletier (1557) jest wymieniony jako popełniający błąd „później" niż Commandino (1575).

## Drobiazgi

- Paragraf o modelu Beltramiego–Kleina („Kolejnym osiągnięciem będzie…") występuje dwa razy: w `12.tex` i w `beltrami-cayley-klein.tex`. To samo dotyczy zdania o 1829 roku (`12.tex` i `gauss-bolyai.tex`).
- „Realizuje się na pseudosferze" wymaga dopisku, że to model lokalny; pełnej płaszczyzny hiperbolicznej nie da się zanurzyć w R³ (Hilbert, 1901).
- „Równoniesprzeczna" wymaga też kierunku odwrotnego (geometria euklidesowa w hiperbolicznej, np. przez horosferę). Beltrami dał tylko jeden kierunek.
- Imię Łobaczewskiego: Mikołaj i Nikołaj występują naprzemiennie.
- „Kiedyś między 1616 oraz 1703 rokiem, John Wallis poda" to lata życia Wallisa. Komentarz w pliku wspomina wykład z 1663.
- „Lombardzki jezuita" (`saccheri.tex`): Saccheri urodził się w San Remo (Liguria). Do sprawdzenia.
- Literówki: „skończoe", „Hjemsleva", „czworokątu", „nieArchimedesowa", „Clairauta" w indeksie (w tekście: Clairaulta).

## Cytat z Delty

Kordos, „Inne światy, inne geometrie", Δ 2016/09, s. 7: artykuł istnieje i omawia aspekty filozoficzne (Kant, Helmholtz), więc pasuje do zdania w `12.tex`.
Kordos podaje jednak Lamberta w 1761 i Kleina w 1870, a notatki mają 1766 i 1871. Nie należy się na nim powoływać jako na źródle tych dat.
