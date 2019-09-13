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

1. Zvolil jsem redukci proměnných v modelu, a sice jsem vypustil cukr<sup>2</sup> a cukr &times; ořechy (`sugar^2` a `sugar*nuts`). Pohledem do scatterplotu výše jsem tipnul, že právě toto proměnné způsobují separaci. Jejich vypuštěním se samozřejmě mohlo stát to, co se stane pokaždé při chybějící důležité proměnné: odhady ostatních parametrů jsou vychýlené. Tato obava mne však příliš netížila, neboť můj předpoklad o existenci interakce ("chuť je ovlivněna cukrem různě intenzivně při různých množstvích ořechů") byl zcela subjektivní. 

Tento krok vedl k pěknému modelu. Z jeho výstupu okomentuji pouze dvě tabulky:

{% include sas_outputs/DOE_ordinal_regression-results-brief.html style="max-width: 500px;"%}

- v sekci `Testing Global Null Hypothesis: BETA=0` se testuje, zda jsem zvolil správný typ modelu, tj. zda platí předpoklad proporcionálního poměru šancí; tuto hypotézu potvrzují dva testy ze tří (a za standard je považován score test)
- v tabulce `Analysis of Maximum Likelihood Estimates` vidíme výsledné odhady a také jejich standardizované verze; ty nyní popíši více
 
### Interpretace modelu

- nuts a nuts^2: podobné váhy + správně orientovaná parabola
- cukr: jednoznačně nejdůležitější
- voda: téměř nezáleží
- trvání: vůbec nezáleží

Celkově model není příliš silný (to vidím z koeficientů a také z tabulky, kterou zde nesdílím), což odpovídá tomu, že navzdory různorodosti experimentálních šarží výsledné chutě _nebyly_ příliš různé (resp. nebyly natolik jiné, abych je byl schopen seřadit s velkou mírou jistoty). Skoro to vypadá, že - s výjimkou cukru - na množství použitých surovin příliš nezáleží. Tento závěr podporuje i široké rozpětí uváděných vstupních surovin, které se vyskytuje v receptech. Ač je překvapivý, je to závěr, s nímž jsem spokojen, neboť odpovídá mému subjektivnímu dojmu z degustace.

Pro zájemce o důkladnější promyšlení tohto závěru uvádím ještě pár poznámek na konci postu

### Pár úvah kolem

- doba rozležení macerátu s cukrovým rozvarem, to byla proměnná mimo moji kontrolu. Ochutnával jsem jeden týden po konci macerace nejdéle macerované šarže, která tedy byla rozležená právě jeden týden, zatímco ty nejrychleji macerované šarže byly v tu dobu již rozležené již 3 týdny.
- část nízké výkonnosti mohla být způsobena i tím, že jsem redukoval model, který jsem používal při generování designů
- Vyhodnotit devět vzorků bylo obtížné. Chuť má mnoho různých nuancí.
- Různí konzumenti mohou mít různé preference; tohle řazení platí jen pro mne samotného, a tedy i závěry modelu jsou šité na míru mně.

---

V [dalším postu](orechovka7.html) konečně odvodíme ten nejlepší recept na ořechovku.
