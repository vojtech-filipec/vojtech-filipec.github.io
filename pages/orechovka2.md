---
layout: page
title: Superstručný úvod do návrhu experimentů
description: Jaké kombinace zkoušet?
---

Společně s touhou připravit nejlepší ořechovku jsem hledal projekt, v němž použiji statistickou metodu zvanou návrh experimentu, resp. Design of Experiments (DoE). Z této metody popíši nutné minimum na jednoduchém příkladu. Jako motivaci ke čtení nejprve shrnu, co si v tomto postu vysvětlíme:


> DoE navrhuje kombinace vstupů, které máme experimentálně ověřit, abychom získali co nejpřesnější popis vztahů mezi vstupními proměnnými a výstupem procesu. Návrh vychází z expertních znalostí o důležitých vstupních proměnných, jejich vztahu k výstupní proměnné a rozsahu vstupních proměnných. Optimální DoE navíc zásadním zpsůsobem snižuje počet nutných experimentů. Výstupem DoE je popis vztahů, který nám umožňuje proces nastavit tak, jak chceme.


### Příklad: Jak nastavit podmínky chemické reakce?
Představme si, že se v nějakém provozu vyrábí produkt P chemickou reakcí dvou surovin: A gramů první suroviny se smíchá s B gramy druhé suroviny a při teplotě S se nechají reagovat po dobu T. Výrobce **hledá takovou kombinaci vstupů A, B, S, a T, aby získal co nejvíce produktu P** (jak typické - nebo znáte někoho, kdo by chtěl vyrobit co nejméně svého produktu?). Rád by znal závislost P na hodnotách a kombinacích všech vstupů (surovin, teploty, času). 

Takový **úkol je ideální pro použití Design of Experiments**. Tahle metoda nám totiž navrhne (odsud pojem Design) kombinace vstupů (od nyní jim budeme říkat experimenty, tj. zkušební kombinace), jimiž se dozvíme o zákonitostech procesu maximum informací. To nám umožní co nejpřesněji určit sílu mezi proměnnými a množstvím výsledného produktu.

Od nyní budeme P naývat **výstupní proměnnou**, zatímco A, B, S a T jsou **vstupní proměnné procesu**. Naším cílem je nalézt **nejlepší design** procesu, tedy takovou kombinaci vstupů, která vyprodukuje co nejvíce výstupního produktu P. Úkol budeme řešit tím, že proces spustíme s různými různé designy (tj. různými kombinacemi proměnných); každému jednomu běhu budeme říkat **experiment**.


### Co potřebujeme pro použití DoE?

Aby mohl výrobce tuto použít metodu, musí umět říci: 

1. které vstupy ovlivňují množství produktu P: v tomto případě jsou to hmotnosti A a B, teplota S a reakční doba T
1. jaké jsou minimální a maximální hodnoty vstupů, při nichž má smysl proces testovat: hledáme zkušenosti typu
  - "vzhledem k velikosti reakční nádoby můžeme dát 1000 - 5000 g A a k tomu 200 - 1000 g B"
  - "máme dobrou zkušenost s teplotami mezi 75 - 95 °C"
  - "při časech pod 30 s zůstává mnoho nezreagovaného A, zato při časech nad 100 s se sice všechny suroviny přemění, jenže P se už rokládá"
1. jakým způsobem každý vstup ovlivňuje množství produktu P: čím konkrétnější, tím lepší:
  - A a B jsou s P svázány vztahem "když zvýším množství A i B, získám více P, ale ani jednoho nesmí být příliš - je tam nějaká rovnováha", 
  - "při vyšší teplotě S dostáváme trochu vyšší P",
  - "necháváme to reagovat co nejkratší dobu, jinak se začne P rozkládat". 

  
Všechna tato fakta v následujícím kroku použijeme při zamyšlení nad tím, jaké designy (kombinace hodnot vstupních faktorů) vyzkoušet.
  
### Jaké designy máme vyzkoušet?
Intuitivně asi cítíte, že pro splnění úkolu nebude stačit vyzkoušet jeden design. Budeme jich muset vyzkoušet několik, možná dokonce několik desítek! To se může docela prodražit. Designy pro experiemntální běhy lze vytvářet dvěma způsoby:

1. **způsob naivní**: Můžeme vyzkoušet úplně všechny možné kombinace všech vstupů a vybrat z nich tu, která povede k nejvyššímu množství P. Takových kombinací bude spousta! Můžeme třeba kombinovat dvě úrovně hmotnosti A (1000 a 5000 g) se dvěma hmotnostmi B (procesu prospívá rovnováha, tak tipneme 200 a 250 g suroviny B pro použití s minimálním množství A a potom 900 a 1000 g pro maximální množství A), čímž získáme čtyři různé kombinace. Každou z nich necháme reagovat při dvou nebo třech teplotách (třeba 75, 85 a 95 °C) a při několika časech mezi 30 a 100 s (tak třeba 35, 65 a 95 s). Původní čtyři kombinace se rozrostou na <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;4\times3\times3" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\inline&space;4\times3\times3" title="4\times3\times3" /></a>, tj. **36 zkušebních kombinací, z nichž jedna bude vykazovat maximální P a zbylých 35 bude k ničemu** - výrobce je vytěží jen zčásti, anebo vůbec. To nezní jako ekonomický přístup k věci. Navíc z tohoto přístupu asi nevykoukáme, jakými zákonitostmi se proces řídí.
1. **způsob založený na statistickém návrhu experimentů (DoE)**: Za použití stejných vstupních informací může zdatný analytik (v dalším textu vyplyne, že tím myslím sebe, resp. toho, kdo se tímto blogem nechá inspirovat) učinit pár jednoduchých kroků, jimiž určí zákonistosti výroby a z nich najde optimální kombinaci vstupů pro maximální P. Těch pár kroků zní:
  - sestavit rovnici, do níž zachytí informace od výrobce (konkrétně _které vstupy_ a _jakým způsobem_ ovlivňují výstup),
  - sepíše si myslitelné rozmezí vstupů pro experimenty (tj. informace o _minimálních a maximálních hodnotách vstupů_)
  - vybrat některý z algoritmů DoE a vygenerovat designy, tj. navrhne, jaké kombinace vstupních hodnot se mají experimentálně vyzkoušet,
  - po experimentech s těmito designy se u každé kombinace dozví výslednou hodnotu P a analýzou naměřených dat získá rovnici, která popisuje proces, 
  - a největší bomba na závěr: **Pokud si navíc zvolí některý z postupů zvaných _Optimální návrh experimentů (Optimal Design of Experiemnts)_, bude mu ke splnění těchto úkolů stačit podstatně méně pokusů než při naivním přístupu.** Místo 36 pokusů jich bude stačit třeba jen 12 -- to znamená třetinové náklady na suroviny, energie i lidskou práci. Za tuto redukci "zaplatíme" tím, že musíme relativně přesně specifikovat (tj. předpokládat) typy závislostí, ovšem je-li proces aspoň trochu známý, tyto zkušenosti bývají k dispozici.
  
  A přesně tento přístup zvolíme pro hledání nejlepšího receptu na ořechovku.
  

### Další zdroje

To je vše, co musíme na tomto místě o Design of Experiments znát. Nebudu nyní představovat, jak rovnici sestavit a jak vybrat algoritmus, neboť to si ukážeme v části věnované ořechovce. Pro zájemce o rigorózní popis metod DoE uvádím odkaz na webovou příručku [NIST/SEMATECH e-Handbook of Statistical Methods](https://www.itl.nist.gov/div898/handbook/pmd/section3/pmd3.htm) a dále odkaz na skvělou knihu, která popisuje Optimal Design of Experiments: [Optimal Design of Experiments: A Case Study Approach](https://www.wiley.com/en-us/Optimal+Design+of+Experiments%3A+A+Case+Study+Approach-p-9780470744611).

---

V dalším postu si přečtěte, [jak se DoE snoubí s hledáním nejlepšího receptu na ořechovku](orechovka3.html).
    
