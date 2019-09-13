---
layout: page
title: Analýza dat
tagline: data analysis
---

Již víte, že pro analyzování použiji ordinální regresi s logitovým linkem. Tento post vysvětluje, jak jsem redukoval proměnné a co analýza ukázala.

---



### Univariátní analýza: proměnná po proměnné...

Nebojte, nezavalím vás spousotu statistik. Prozkoumejme závislosti faktorů mezi sebou a vztah k chuti graficky. Tento scatterplot říká pár zajímavých skutečností o vygenerovaných designech a jejich vazbě k pořadí chuti (tj. `taste_rank`):  

{% include sas_outputs/DOE_ordinal_regression-scatterplot.html style="max-width: 200px;"%}

Všimněte si následujícího:
- množství vody: Všimněte si, že všechny designy používají maximum (800 ml), nebo naopak minimum (0 ml) vody, ale žádný netestuje efekt vody mezi nimi. Je to tím, že množství vody se v modelu vyskytuje pouze v lineárním členu. Pro odhad přímky stačí dva body, a proto není zapotřebí zkoušet žádný další.
- cukr<sup>2</sup> a cukr &times; ořechy (`sugar^2` a `sugar*nuts`): Ve spodním pravém rohu je patrné, že tyto dva členy jsou hodně korelované. Jeden z nich je adept na vyřazení z modelu.
- chuť a cukr &times; ořechy (`taste_rank` a `sugar*nuts`): V pravém horním grafu je vidět, že tato proměnná koreluje pěkně s chutí. Její interpretace je však bez přítomnosti základních členů (tj. samotného cukru a samotného množství ořechů) obtížná. Tyto členy mají však k chuti slabší vazbu a očekávám, že při fitování modelu dostanou menší význam. Pro nalezení ideálního receptu však potřebuji _především_ znalost samotných členů. I z tohoto důvodu je ten interakční člen kandidátem na vyřazení.

### Fitování modelu
Nejdříve jsem zkoušel vysvětlovat přesné pořadí pomocí hodnot vstupních faktorů.

kód?
výstupní HTML?

Výsledek: faktory nebyly signifikantní, pouze cukr se ukázal být skoro signifikantní. Těžké porovnat, tj. pořadí bylo zjevně nepřesné. Také to vysvětlovalo široké rozpětí hodno tv receptech. 


Potom jsem vyřadil cukrové šarže. Co odhalila analýza dat?


Nakonec jsem chutě seskupil.


### Pár úvah kolem

- Proměnná mimo moji kontrolu: doba zrání, ochutnával jsem týden po konci macerace nejdéle macerované šarže
- Vyhodnotit devět vzorků bylo obtížné. Jedna odezva pro různé nuance chuti.
- Různí konzumenti mohou mít různé preference


---

V [dalším postu](orechovka7.html) ...
