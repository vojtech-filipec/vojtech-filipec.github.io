---
layout: page
title: Pár slov o návrhu experimentů.
description: Jaké kombinace zkoušet?
---

### Co je to Design of Experiments (DoE), resp. Návrh experimentu

Společně s touhou připravit nejlepší ořechovku jsem hledal projekt, v němž použiji statistickou metodu zvanou návrh experimentu, resp. Design of Experiments (DoE). Neobejdeme se bez pojmů _statistika_ a _rovnice_, a abych jimi nikoho nevyděsil, vše vysvětlím na jednoduchém případu:

#### Optimalizace chemické výroby
Představme si, že v nějakém provozu se vyrábí produkt P chemickou reakcí dvou durovin: A gramů první suroviny se smíchá s B gramy druhé suroviny a při teplotě S se nechají reagovat po dobu T. Výrobce **hledá takovou kombinaci vstupů A, B, S, a T, aby získal co nejvíce produktu P** (jak typické - nebo znáte někoho, kdo by chtěl vyrobit co nejméně svého produktu?). Rád by znal závislost P na hodnotách vstupů (surovin, teploty, času). Nezná přesné zákonitosti, kterými se reakce řídí, ale vypozoroval, že větší množství A vede k většímu množství P, ale zároveň A musí být v nějaké rovnováze s B. Také si všiml, že T nesmí být příliš krátké, neboť A a B nestihnou reagovat, ale ani příliš dlouhé, neboť P se začně rozkládat. 

Takovýto úkol je ideální situací, v níž lze použít Design of Experiments. Tento přístup nám totiž umožňuje spočítat sílu mezi proměnnými a množstvím výsledného produktu.

Aby mohl výrobce tuto použít metodu, musí umět říci: 
1. které vstupy ovlivňují množství produktu P: v tomto případě jsou to hmotnosti A a B, teplota S a reakční doba T
1. jakým způsobem každý vstup ovlivňuje množství produktu P: předpokládejme, že jsme se dověděli, že:
  - A a B jsou s P svázány vztahem "když zvýším množství A i B, získám více P, ale zároveň A a B musí mít přibližně stejné hodnoty", 
  - "při vyšší teplotě S dostáváme trochu vyšší P",
  - "necháváme to reagovat co nejkratší dobu, jinak se začne P rozkládat". 
1. jaké jsou minimální a maximální hodnoty vstupů, při nichž má smysl proces testovat: hledáme zkušenosti typu
  - "vzhledem k velikosti reakční nádoby můžeme dát 1000 - 5000 g A a k tomu 200 - 1000 g B"
  - "máme dobrou zkušenost s teplotami mezi 75 - 95 °C"
  - "při časech pod 30 s zůstává mnoho nezreagovaného A, zato při časech nad 100 s se všechno A i B přemění, jenže P se začne rozkládat"
  
#### Jak najít nejlepší kombinaci
V chemickém příkladu je P **výstupní proměnnou**, zatímco A, B, S a T jsou **vstupní proměnné procesu**. Hledáme takovou kombinaci vstupů A, B, S, a T, aby získal co nejvíce produktu P. K tomu lze přistoupit dvěma způsoby:

1. způsob naivní: Výrobce může vyzkoušet všechny možné kombinace všech vstupů a vybrat z nich tu, která povede k nejvyššímu množství P. Může třeba kombinovat dvě úrovně hmotnosti A (1000 a 5000 g) se dvěma hmotnostmi B (ví, že procesu prospívá rovnováha, tak tipne 200 a 1000 g), čímž získá čtyři různé kombinace. Každou z nich vyzkouší při dvou nebo třech teplotách (třeba 75, 85 a 95 °C) a při několika časech mezi 30 a 100 s (tak třeba 35, 65 a 95 s). Původní čtyři kombinace se rozrostou na 4*3*3=36 zkušebních kombinací, z nichž jedna bude vykazovat maximální P a zbylých 35 budeme moci vytěžit jen zčásti, anebo vůbec. 
1. způsob založený na statistickém plánování pomocí DoE: 

Cílem metody je kvantifikace vztahů P a všech vstupních proměnných. 

V dalším postu si přečtěte, [jak se DoE snoubí s hledáním nejlepšího receptu na ořechovku](orechovka2.html).
