---
layout: page
title: Použití DoE při hledání nejlepšího receptu
tagline: vstupy 
---

V předchozích postech jsem vysvětlil, co musíme umět říci pro [použití DoE](orechovka2.html) a jak jsem došel k tomu, že budu testovat [čtyři faktory](orechovka3.html). Nyní objasním, z jakých hodnot jsem vycházel při generování designů.

---

Zopakujme si, co musel umět fiktivní vařič chemikálií umět říci pro použití DoE: 
1. na kterých vstupech záleží výstup
1. jakým způsobem každý vstup ovlivňuje výstup 
1. jaké jsou minimální a maximální hodnoty vstupů, při nichž má smysl proces testovat

Tyto tři skupiny znalostí nyní definujeme pro výrobu ořechovky.

### Které vstupy ovlivňují chuť ořechovky
Došel jsem k tomu, že budu testovat čtyři faktory, které si označím následovně:

- _x_: množství ořechů na 1 litr lihu, místo počtu budu uvažovat hmotnost ořechů v gramech 
- _v_: množství vody, jímž rozředím 1 l lihu, čímž ovlivním koncentraci lihu pro maceraci; vodu budu měřit v gramech
- _d_: počet týdnů pro maceraci
- _m_: množství cukru pro doslazení v gramech

### Vztah mezi vstupními faktory a chutí
Předpokládám tento vztah:

<img src="https://latex.codecogs.com/svg.latex?\inline&space;y=\beta_{0}&plus;\beta_{1}x&plus;\beta_{2}x^2&plus;&space;\beta_{3}m&plus;\beta_{4}m^2&plus;\beta_{5}xm&plus;&space;\beta_{6}v&plus;&space;\beta_{7}d&plus;\epsilon" title="y=\beta_{0}+\beta_{1}x+\beta_{2}x^2+ \beta_{3}m+\beta_{4}m^2+\beta_{5}xm+ \beta_{6}v+ \beta_{7}d+\epsilon" />

Proč jsem volil tuto formu? Vycházím z těchto předpokladů:
- členy s _x_ a _x<sup>2</sup>_ ... když bud eořechů příliš málo, bude chuť slabá; když jich bude příliš, dostanu likér s chutí jodové tinktury; hledám tedy nějakou rovnováhu mezi těmito extrémy a tu nejsnáze aproximuji kvadratickou funkcí
- členy s _m_ a _m<sup>2</sup>_ ... stejně jako u _x_ musí být i cukru tak akorát
- člen _xm_ ... vliv cukru na výseldnou chuť bude záležet na množství ořechů
- člen _v_ ... toto je voda pro rozředění lihu před macerací; další vodu budu dolévat po maceraci, aby měly všechny šarže stejnou koncentraci alkoholu; lineárním členem vyzkouším, zda koncentrace lihu pro maceraci má vliv na chuť 
- člen s _d_ ... myslím, že efekt délky macerace se časem nasytí: očekávám rozdíl mezi macerací trvající 3 týdny a 5 týdnů, ale po čase už se vše z ořechů vylouhuje a dodatečná macerace nic dalšího do chuti nepřinese. Zde bych ideálně použil _ln(d)_, jenže pro rovnice s logaritmickým členem je obtížné generovat designy. Logaritmus jsem tedy aproximoval jeho Taylorovým polynomem a použil jsem jen první dva členy: _-0,5 + 2d_, přičemž konstanta bude obsažena v _&beta;<sub>o</sub>_
- ~člen _d<sup>2</sup>_~ z Taylorova rozvoje jsem musel vypustit, neboť jsem se rozhodl připravit devět experimentů a na odhad jeho koeficientu už mi nezbyly stupně volnosti 

### Použitá minima a maxima 
Prozkoumal jsem množství ze všech receptů a definoval jsem tato minima a maxima:

|------|---------|----------|------------|
|vstup	|jednotka	|minimum	|maximum|
|------|---------|----------|------------|
|x	|g|	330	|550|
|m	|g|	600	|1500|
|v	|g|	0	|851|
|d	|týdnů|	3|	6|

Pokud se divíte maximálnímu množství cukru (851 g), mrkněte do sekce níže - tam uvedená rovnice říká, jak vzroste objem roztoku po přidání cukru. Při této maximální dávce cukru už bych nemohl přidávat žádnou vodu!

### Pár úvah kolem
#### Množství cukru
Odvození množství vody pro finální koncentraci 30 pct, vycházíme-li z 1000 gramů vody:

<img src="https://latex.codecogs.com/svg.latex?\inline&space;v\le-\frac{25}{46}m&plus;\frac{50}{30}1000" title="v\le-\frac{25}{46}m+\frac{50}{30}1000" />

### Jak jsem generoval designy v SASu




---

V dalším postu si přečtěte, [jaká minima a maxima vyzkouším a jaký model předpokládám](orechovka4.html).
    
