---
layout: page
title: Recept na nejlepší ořechovku
tagline: 
---

Když už chápeme, jak záleží a nezáleží na jednotlivých vstupech ([předchozí post](orechovka6.html)), můžeme konečně *odvodit nejlepší recept*!

---

### Jak optimální recept odvodit?

Při odvozování receptu budeme *maximalizovat součet příspěvků jednotlivých vstupů.* Proč a co to znamená?


V předchozí části jsme si vysvětlili, že když hodnotíme jednotlivé proměnné, záleží na tom, zda je koeficient před nimi kladný, nebo záporný. Při posuzování kombinace všech našich vstupů si musíme uvědomit následující ekvivalenci:
<img src="https://latex.codecogs.com/svg.latex?\inline&space;\alpha&space;_{j}&space;&plus;&space;\sum&space;\beta&space;_{i}x&space;_{i}&space;\equiv&space;\alpha&space;_{j}&space;&plus;&space;1\cdot&space;(&space;\sum&space;\beta&space;_{i}x&space;_{i})"/>

To vlastně znamená, že před kombinací koeficientů a hodnot proměnných si domyslíme násobení jednou, tedy kladným koeficientem. Teď už můžeme použít pravidlo z předchozího postu:
> proměnné s kladným koeficientem: vyšší hodnota proměnné nás posouvá na logistické křivce doprava, tj. vede k vyšší pravděpodobnosti

Se znalostí tohoto pravidla odvodíme, kolik které suroviny použít.


### Množství jednotlivých surovin

#### Cukr
Proměnná `sugar` má v modelu záporný koeficient. Pro maximalizaci příspěvku cukru ho musíme dát co nejméně. Zároveň musíme myslet na to, že závěry platí v rozsahu hodnot, které jsme testovali, tedy při uvážení rozsahu, který jsme definovali [při generování designů](orechovka4.html). Tam uvedené minimum je 600 g cukru na 1 litr lihu.

#### Ořechy
Množství ořechů (`nuts`) má kladný koeficient, a pro maximalizaci chuti tedy musíme použít co nejvíce ořechů. Jako maximum jsme definovali 25 kusů, tj. 550 g ořechů na 1 litr lihu. 

#### Voda pro počáteční rozředění lihu 
Rozředěním 80% lihu jsme testovali, zda má koncentrace alkoholu, v níž ořechy macerujeme, vliv na chuť. Analýza dat ukázala, že na množství přidané vody, tj. koncentraci alkoholu nezáleží. Pro maceraci tedy můžeme použít libovolně silný roztok, jen si musíme dávat pozor na to, kolik vody dolijeme pro rozležení, abychom výsledný likér měl takovou koncentraci, kterou si přejeme. Musíme si také pohlídat, jak budeme sladit - množství cukru je totiž vztaženo na 1 litr 80% lihu. 

#### Délka macerace
Tato proměnná také není statisticky významná, tj. na délce louhování nezáleží. Závěr opět platí jen v rámci hodnot, které jsme testovali, a měli bychom tedy volit dobu mezi 3 a 6 týdny. 

### Nejlepší recept na ořechovku
... tedy zní:
> - 550 gramů nezralých vlašškých ořechů trhaných na svátek sv. Jana
- 1 litr 80 % alkoholu
- 600 gramů bílého cukru
- koření dle chuti      
- vodu pro snížení koncentrace alkoholu                  
Ořechy očistěte, nakrájejte a dejte macerovat do lihu. Láhev s macerátem by měla být jen jemně dovřená, maceraci svědčí sluneční svit a občasné promíchání. Po 3 až 6 týdnech ořechy slijte, macerát přeceďte a smíchejte jej se sirupem, který svaříte z cukru a vody (množství volte podle toho, jak silný chcete likér mít; pomoci vám může být závislost uvedená [na konci tohoto postu](orechovka4.html)) a před vmícháním necháte vychladnout. Do smíchaného roztoku přidejte i koření a nechejte rozležet - čím déle, tím lépe. Doporučuji průběžně ochutnávat, abyste zjistili, jak se chuť mění a kdy vám nejvíce vyhovuje.

Nezapomeňte: Hodnocení chutí jsem prováděl já. Budu rád, když recept někdy zkusíte a napíšete mi, jak vám chutná, ale není zaručeno, že bude nejlepší i pro vás! Budete-li se mým přístupem chtít inspirovat a budete-li potřebovat radu, [napište mi zprávu](https://github.com/vojtech-filipec/vojtech-filipec.github.io/issues).

---
