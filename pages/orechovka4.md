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
V předchozím postu jsem došel k tomu, že budu testovat čtyři faktory, které si označím následovně:

- _x_: množství ořechů na 1 litr lihu, místo počtu budu uvažovat hmotnost ořechů v gramech 
- _v_: množství vody, jímž rozředím 1 l lihu, čímž ovlivním koncentraci lihu pro maceraci; vodu budu měřit v gramech
- _d_: počet týdnů pro maceraci
- _m_: množství cukru pro doslazení v gramech

### Vztah mezi vstupními faktory a chutí
Předpokládám tento vztah:

<img src="https://latex.codecogs.com/svg.latex?\inline&space;y=\beta_{0}&plus;\beta_{1}x&plus;\beta_{2}x^2&plus;&space;\beta_{3}m&plus;\beta_{4}m^2&plus;\beta_{5}xm&plus;&space;\beta_{6}v&plus;&space;\beta_{7}d&plus;\epsilon" title="y=\beta_{0}+\beta_{1}x+\beta_{2}x^2+ \beta_{3}m+\beta_{4}m^2+\beta_{5}xm+ \beta_{6}v+ \beta_{7}d+\epsilon" />

Proč jsem volil tuto formu? Vycházím z těchto předpokladů:
- členy s _x_ a _x<sup>2</sup>_ ... když bude ořechů příliš málo, bude chuť slabá; když jich bude příliš, dostanu likér s chutí jodové tinktury; hledám tedy nějakou rovnováhu mezi těmito extrémy a tu nejsnáze aproximuji kvadratickou funkcí
- členy s _m_ a _m<sup>2</sup>_ ... stejně jako u _x_ musí být i cukru tak akorát
- člen _xm_ ... vliv cukru na výseldnou chuť bude záležet na množství ořechů
- člen _v_ ... toto je voda pro rozředění lihu před macerací; další vodu budu dolévat po maceraci, aby měly všechny šarže stejnou koncentraci alkoholu; lineárním členem vyzkouším, zda koncentrace lihu pro maceraci má vliv na chuť 
- člen s _d_ ... myslím, že efekt délky macerace se časem nasytí: očekávám rozdíl mezi macerací trvající 3 týdny a 5 týdnů, ale po čase už se vše z ořechů vylouhuje a dodatečná macerace nic dalšího do chuti nepřinese. Zde bych ideálně použil _ln(d)_, jenže pro rovnice s logaritmickým členem je obtížné generovat designy. Logaritmus jsem tedy aproximoval jeho Taylorovým polynomem a použil jsem jen první dva členy: _-0,5 + 2d_, přičemž konstanta bude obsažena v _&beta;<sub>o</sub>_
- ~~člen _d<sup>2</sup>_~~ z Taylorova rozvoje jsem musel vypustit, neboť jsem se rozhodl připravit devět experimentů a na odhad jeho koeficientu už mi nezbyly stupně volnosti 


### Použitá minima a maxima 
Prozkoumal jsem množství ze všech receptů a definoval jsem tato minima a maxima:

|------|---------|----------|------------|
|vstup	|jednotka	|minimum	|maximum|
|------|---------|----------|------------|
|x			|kusů|	15|25|
|m			|g|	600	|1500|
|v			|g|	0	|851|
|d			|týdnů|	3|	6|

Pokud se divíte maximálnímu množství cukru (851 g), mrkněte se na konec postu - tam uvedená rovnice říká, jak poklesne koncentrace alkoholu v roztoku po přidání cukru a vody. 

### Generování designů
Ač pro většinu své práce používám Python, nenašel jsem v něm žádnou knihovnu pro generování designů metodami Optimal DoE. Naopak v SASu je k dispozici dobře dokumentovaná procedura `PROC OPTEX`, která umožňuje jednoduše generovat D-optimální designy. Tímto děkuji firmě SAS Institute Inc. za to, že [skrze webový prohlížeč](https://odamid.oda.sas.com/) svůj software poskytuje gratis pro osobní nekomerční využití. 

Experimentální designy vypadají takto (kód pro generování je na mém GitHubu):

|----|------|---------|----------|------------|
|# |x	|m	|v	|d|
|----|------|---------|----------|------------|
|1| 15 |600 |851 |6.0|
|2| 15 |1100 |0 |3.0|
|3| 15 |1500 |0 |4.5|
|4| 19 |600 |0 |4.5|
|5| 19 |1500 |851 |6.0|
|6| 25 |600 |0 |6.0|
|7| 25 |600 |851 |3.0|
|8| 25 |1100 |851 |4.5|
|9| 25 |1500 |0| 3.0|


### Pár úvah kolem
#### Jak spolu souvisí maximální množství cukru a vody?
Výsledný likér má mít koncentraci 30 %. Použitý líh má koncentraci 80 % a k rozředění dojde jednak přidáním vody _v_ na počátku a jednak přidáním cuktu _m_. Obojího však smím přidat jen tolik, aby koncentrace neklesla pod 30 %. "Součet" množství vody a cukru tedy nesmí překročit nějakou mez a pouze jeden z těchto parametrů může být volen nezávisle. Já jsem si řekl, že jím je cukr, a maximální množství vody jsem určil z ředící rovnice a z požadavku, aby výsledný roztok měl 30 % alkoholu. 

<img src="https://latex.codecogs.com/svg.latex?\inline&space;v\le-\frac{25}{46}m&plus;\frac{50}{30}1000" title="v\le-\frac{25}{46}m+\frac{50}{30}1000" />

Pro generování designů je praktické, aby maxima a minima byla konstantní, nikoliv na sobě závislá, a tak jsem z nerovnosti výše určil, že pro _m<sub>max</sub> = 1500 ml_ je _v<sub>max</sub> = 851 g_. Bude-li naopak roztok po přidání obojího ještě stále příliš silný, nepředstavuje to problém: do 30 % doředím přidáním vody na konci macerace.

---

V dalším postu si přečtěte, [jak jsem ochutnával a vyhodnocoval](orechovka5.html).
  