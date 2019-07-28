---
layout: page
title: Superstručný úvod do návrhu experimentů
description: Jaké kombinace zkoušet?
---

### Co je to Design of Experiments (DoE)?

Společně s touhou připravit nejlepší ořechovku jsem hledal projekt, v němž použiji statistickou metodu zvanou návrh experimentu, resp. Design of Experiments (DoE). Z této metody popíši nutné minimum a slibuji, že nikoho nevyděsím použitím složité matematiky. Zároveň se však neobejdeme bez pojmů _statistika_, _rovnice_ a _pravděpodobnost_, a abych pravděpodobnost vyděšení minimalizovat, vše vysvětlím na jednoduchém příkladu:

#### Příklad: nastavení chemické reakce
Představme si, že se v nějakém provozu vyrábí produkt P chemickou reakcí dvou surovin: `A` gramů první suroviny se smíchá s `B` gramy druhé suroviny a při teplotě `S` se nechají reagovat po dobu `T`. Výrobce **hledá takovou kombinaci vstupů A, B, S, a T, aby získal co nejvíce produktu P** (jak typické - nebo znáte někoho, kdo by chtěl vyrobit co nejméně svého produktu?). Rád by znal závislost P na hodnotách a kombinacích všech vstupů (surovin, teploty, času). Nezná přesné zákonitosti, kterými se reakce řídí, ale experimentováním vypozoroval, že větší množství A vede k většímu množství P, ale zároveň A musí být v nějaké rovnováze s B. Také si všiml, že T nesmí být příliš krátké, neboť A a B nestihnou reagovat, ale ani příliš dlouhé, neboť P se začně rozkládat. 

Takový úkol je ideální pro použití Design of Experiments. Tahle metoda nám totiž navrhne (odsud pojem Design) experimenty, jimiž se dozvíme o zákonitostech, jimiž se proces řídí, maximum informací. To nám umožní co nejpřesněji určit sílu mezi proměnnými a množstvím výsledného produktu.

Aby mohl výrobce tuto použít metodu, musí umět říci: 
1. které vstupy ovlivňují množství produktu P: v tomto případě jsou to hmotnosti A a B, teplota S a reakční doba T
1. jakým způsobem každý vstup ovlivňuje množství produktu P: předpokládejme, že jsme se dověděli, že:
  - A a B jsou s P svázány vztahem "když zvýším množství A i B, získám více P, ale ani jednoho nesmí být příliš - je tam nějaká rovnováha", 
  - "při vyšší teplotě S dostáváme trochu vyšší P",
  - "necháváme to reagovat co nejkratší dobu, jinak se začne P rozkládat". 
1. jaké jsou minimální a maximální hodnoty vstupů, při nichž má smysl proces testovat: hledáme zkušenosti typu
  - "vzhledem k velikosti reakční nádoby můžeme dát 1000 - 5000 g A a k tomu 200 - 1000 g B"
  - "máme dobrou zkušenost s teplotami mezi 75 - 95 °C"
  - "při časech pod 30 s zůstává mnoho nezreagovaného A, zato při časech nad 100 s se všechno A i B přemění, jenže část P se už rozloží"
  
#### Jak najít nejlepší kombinaci
V chemickém příkladu je P **výstupní proměnnou**, zatímco A, B, S a T jsou **vstupní proměnné procesu**. Hledáme takovou kombinaci (**design**) vstupů, která vyprodukuje co nejvíce výstupního produktu P. Určitě budeme muset vyzkoušet několik designů, tj. kombinací. Experimentálně lze hledat dvěma způsoby:

1. **způsob naivní**: Výrobce může vyzkoušet všechny možné kombinace všech vstupů a vybrat z nich tu, která povede k nejvyššímu množství P. Může třeba kombinovat dvě úrovně hmotnosti A (1000 a 5000 g) se dvěma hmotnostmi B (ví, že procesu prospívá rovnováha, tak tipne 200 a 1000 g), čímž získá čtyři různé kombinace. Každou z nich vyzkouší při dvou nebo třech teplotách (třeba 75, 85 a 95 °C) a při několika časech mezi 30 a 100 s (tak třeba 35, 65 a 95 s). Původní čtyři kombinace se rozrostou na 4 x 3 x 3, tj. **36 zkušebních kombinací, z nichž jedna bude vykazovat maximální P a zbylých 35 bude k ničemu** - výrobce vytěží jen zčásti, anebo vůbec. To nezní jako ekonomický přístup k věci. Navíc kromě jedné dobré kombinace z těch zbylých nevykouká, jakými zákonitostmi se proces řídí.
1. **způsob založený na statistickém návrhu experimentů (DoE)**: Za použití stejných vstupních informací může zdatný analytik (v dalším textu vyplyne, že tím myslím sebe, resp. toho, kdo se tímto blogem nechá inspirovat) učinit pár jednoduchých kroků, jimiž nejenže najde optimální kombinaci vstupů pro maximální P, ale také matematický popis celého procesu. Těch pár kroků zní:
  - sestavit rovnici, do níž zachytí informace od výrobce (konkrétně _které vstupy_ a _jakým způsobem_ ovlivňují výstup),
  - vybrat některý z algoritmů DoE a vygenerovat designy, tj. navrhne, jaké kombinace vstupních hodnot se mají experimentálně vyzkoušet,
  - po experimentech s těmito designy se u každé kombinace dozví výslednou hodnotu P, 
  - analýzou naměřených dat získá rovnici, která popisuje proces, 
  - a největší bomba na závěr: **Pokud si navíc zvolí některý z postupů zvaných _Optimální návrh experimentů (Optimal Design of Experiemnts)_, bude mu ke splnění těchto úkolů stačit podstatně méně pokusů než při naivním přístupu.** Místo 36 pokusů jich bude stačit třeba jen 12 -- to znamená třetinové náklady na suroviny, energie i lidskou práci. A přesně tento přístup zvolíme pro hledání nejlepšího receptu na ořechovku.

#### Suma sumárum
...aneb ještě jednou a stručně: 
> DoE navrhuje kombinace vstupů, které máme experiemntálně ověřit, abychom získlai co nejpřesnější popis vztahů mezi vstupními proměnnými a výstupem procesu. Návrh vychází z expertních znalostí o důležitých vstupních proměnných, jejich vztahu k výstupní proměnné a rozsahu vstupních proměnných. Optimální DoE navíc zásadním zpsůsobem snižuje počet nutných experimentů. Výstupem DoE je popis vztahů, který nám umožňuje proces nastavit optimálně.

To je vše, co musíme na tomto místě o Design of Experiments znát. Nebudu nyní představovat, jak rovnici sestavit a jak vybrat algoritmus, neboť to si ukážeme v části věnované ořechovce. Pro zájemce o rigorózní popis metod DoE uvádím odkaz na webovou příručku [NIST/SEMATECH e-Handbook of Statistical Methods](https://www.itl.nist.gov/div898/handbook/pmd/section3/pmd3.htm) a dále odkaz na skvělou knihu, která popisuje Optimal Design of Experiments: [Optimal Design of Experiments: A Case Study Approach](https://www.wiley.com/en-us/Optimal+Design+of+Experiments%3A+A+Case+Study+Approach-p-9780470744611).

V dalším postu si přečtěte, [jak se DoE snoubí s hledáním nejlepšího receptu na ořechovku](orechovka3.html).
