---
layout: page
title: Použití DoE při hledání nejlepšího receptu
tagline: vstupy 
---

V předchozích postech jsem vysvětlil, co musíme umět říci pro [použití DoE](orechovka2.html) a jak jsem došel k tomu, že budu testovat [čtyři faktory](orechovka3.html). 

---

Zopakujme si, co musel umět fiktivní vařič chemikálií umět říci pro použití DoE: 
1. na kterých vstupech záleží výstup
1. jakým způsobem každý vstup ovlivňuje výstup 
1. jaké jsou minimální a maximální hodnoty vstupů, při nichž má smysl proces testovat

Tyto tři skupiny znalostí nyní definujeme pro výrobu ořechovky.

### Faktory ovlivňující chuť ořechovky
Došel jsem k tomu, že budu testovat čtyři faktory, které si označím následovně:

- _x_: množství ořechů na 1 litr lihu, místo počtu budu uvažovat hmontost ořechů v gramech 
- _v_: množství vody, jímž rozředím 1 l lihu, čímž ovlivním okncentraci lihu pro maceraci; vodu budu měřit v gramech
- _d_: počet týdnů pro maceraci
- _m_: množství cukru pro doslazení v gramech

### Předpokládaný vztah mezi vstupními faktory a chutí
<img src="https://latex.codecogs.com/svg.latex?\inline&space;y=\beta_{0}&plus;\beta_{1}x&plus;\beta_{2}x^2&plus;&space;\beta_{3}m&plus;\beta_{4}m^2&plus;\beta_{5}xm&plus;&space;\beta_{6}v&plus;&space;\beta_{7}d&plus;\beta_{8}d^2&plus;\epsilon" title="y=\beta_{0}+\beta_{1}x+\beta_{2}x^2+ \beta_{3}m+\beta_{4}m^2+\beta_{5}xm+ \beta_{6}v+ \beta_{7}d+\beta_{8}d^2+\epsilon" />

Co znamenají jednotlivé symboly:
 h<sub>&theta;</sub>(x) = &theta;<sub>o</sub> x + &theta;<sub>1</sub>x

### Použitá minima a maxima z tabulky se souhrnem receptů

### Pár úvah kolem
#### Množství cukru
Odvození množství vody pro finální koncentraci 30 pct
<img src="https://latex.codecogs.com/svg.latex?\inline&space;v\le-\frac{25}{46}m&plus;\frac{50}{30}1000" title="v\le-\frac{25}{46}m+\frac{50}{30}1000" />

Jak jsem generoval designy v SASu




---

V dalším postu si přečtěte, [jaká minima a maxima vyzkouším a jaký model předpokládám](orechovka4.html).
    