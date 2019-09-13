---
layout: page
title: Analýza dat
tagline: data analysis
---

Již víte, že pro analyzování použiji ordinální regresi s logitovým linkem. Tento post vysvětluje, jak jsem redukoval proměnné a co analýza ukázala.

---



### Univariátní analýza: proměnná po proměnné...

Prozkoumejme graficky závislosti faktorů mezi sebou a vztah k chuti. Tento scatterplot říká pár zajímavých skutečností o vygenerovaných designech a jejich vazbě k pořadí chuti (tj. `taste_rank`):  

{% include sas_outputs/DOE_ordinal_regression-scatterplot.html style="max-width: 500px;"%}

Všimněte si následujícího:
- množství vody: Všimněte si, že všechny designy používají maximum (800 ml), nebo naopak minimum (0 ml) vody, ale žádný netestuje efekt vody mezi nimi. Je to tím, že množství vody se v modelu vyskytuje pouze v lineárním členu. Pro odhad přímky stačí dva body, a proto není zapotřebí zkoušet žádný další.
- cukr<sup>2</sup> a cukr &times; ořechy (`sugar^2` a `sugar*nuts`): Ve spodním pravém rohu je patrné, že tyto dva členy jsou hodně korelované. Jeden z nich je adept na vyřazení z modelu.
- chuť a cukr &times; ořechy (`taste_rank` a `sugar*nuts`): V pravém horním grafu je vidět, že tato proměnná koreluje pěkně s chutí. Její interpretace je však bez přítomnosti základních členů (tj. samotného cukru a samotného množství ořechů) obtížná. Tyto členy mají však k chuti slabší vazbu a očekávám, že při fitování modelu dostanou menší význam. Pro nalezení ideálního receptu však potřebuji _především_ znalost samotných členů. I z tohoto důvodu je ten interakční člen kandidátem na vyřazení.

### Fitování modelu

Chceme-li popsat výsledný model, bez pomoci statistiky se neobejdeme. Uvedu však jen nutné minimum a především popíši, s čím vším jsem se musel vypořádat a jak jsem postupoval. 

1. Nejdříve jsem zkoušel vysvětlovat přesné pořadí pomocí hodnot vstupních faktorů za použití modelu, který jsem specifikoval [v předchozím postu](orechovka4.html). Narážel jsem však na problém s kompletní, resp. kvazi-kompletní separací pozorování. Co to znamená? Při použití toho uvažovaného modelu vysvětluje model na těchto datech cílovou proměnnou zcela (nebo téměř) dokonale, a maximálně věrohodné odhady parametrů by byly nekonečně velké! Já jsem však potřeboval odhady parametrů znát, abych mohl sestavit nejlepší recept! Na tuto situaci jsem měl dvě možná řešení:
- vyřadit tři nejsladší vzorky, neboť velké množství cukru přebíjelo všechny ostatní faktory nejen při ochutnávání (tyto šarže byly _podstatně_ horší než ostatní), ale také při hledání parametrů.
- redukovat model: vypustit některé proměnné
- (také jsem se snažil použít Firthovu exaktní metodu odhadu a zkoušel jsem i model s parciální proporcionalitou, tzv. partial proportional odds model, ale tudy cesta nevedla)

1. Zvolil jsem redukci proměnných v modelu, a sice jsem vypustil cukr<sup>2</sup> a cukr &times; ořechy (`sugar^2` a `sugar*nuts`). Pohledem do scatterplotu výše jsem tipnul, že právě toto proměnné způsobují separaci. Jejich vypuštěním se samozřejmě mohlo stát to, co se stane pokaždé při chybějící důležité proměnné: odhady ostatních parametrů jsou vychýlené. Tato obava mne však příliš netížila, neboť můj předpoklad o existenci interakce ("chuť je ovlivněna cukrem různě intenzivně při různých množstvích ořechů") byl zcela subjektivní. Toto vedlo k pěknému modelu:

{% include sas_outputs/DOE_ordinal_regression-results-brief.html style="max-width: 500px;"%}




Také to vysvětlovalo široké rozpětí hodno tv receptech. 


Potom jsem vyřadil cukrové šarže. Co odhalila analýza dat?


Nakonec jsem chutě seskupil.


### Pár úvah kolem

- Proměnná mimo moji kontrolu: doba zrání, ochutnával jsem týden po konci macerace nejdéle macerované šarže
- Vyhodnotit devět vzorků bylo obtížné. Jedna odezva pro různé nuance chuti.
- Různí konzumenti mohou mít různé preference


---

V [dalším postu](orechovka7.html) ...
