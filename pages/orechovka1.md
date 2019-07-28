---
layout: page
title: Jak mne napadlo dát se do experimentů s ořechovkou.
tagline: orechovka - from idea to the first steps
description: Od prvního nápadu k plánu designů.
---





Jeden rodinný známý nám léta dodával výbornou domácí [ořechovku](https://cs.wikipedia.org/wiki/O%C5%99echovka_(n%C3%A1poj)). Několikrát jsem si říkal, že ji zkusím vyrobit sám, ovšem potýkal jsem se se značnou variabilitou receptů - recept našeho známého nebyl k mání a na internetu jsem našel širokou škálu postupů, potřebných surovin, jejich množství a louhovacích časů. 

Zároveň jsem hledal projekt, v němž si vyzkouším statistickou metodu zvanou návrh experimentu, resp. Design of Experiments (DoE). Ta umožňuje popsat výrobní proces, který je popsán nedostatečně (nebo vůbec), jestliže umíme odhadnout, které vstupy ovlivňují výstupní proměnnou a jak ji ovlivňují. Klasickým příkladem může být chemický proces, v němž mícháme A gramů první suroviny, B gramů druhé suroviny a při teplotě S je necháme reagovat po dobu T, abychom získali nějaký produkt P. V takovém případě je P výstupní proměnnou, zatímco A, B, S a T jsou vstupní parametry.

### First things

Start by cloning
[the repository for the present site](https://github.com/kbroman/simple_site). (Or,
alternatively, fork it and then clone your own version.)

    git clone git://github.com/kbroman/simple_site

_something meaningful_.)

Edit the
[lines about the site name and author](https://github.com/kbroman/simple_site/blob/gh-pages/_config.yml#L11-L17).

    title : simple site
    author :
      name : Karl Broman
      email : kbroman@gmail.com
      github : kbroman
      twitter : kwbroman
      feedburner : nil

    BASE_PATH : https://kbroman.github.io/simple_site

This is the only bit of html you'll
have to deal with.

    <!-- start of Karl's footer; modify this part -->
        <a href="https://creativecommons.org/publicdomain/zero/1.0/">  ...
        <a href="https://kbroman.org">Karl Broman</a>
    <!-- end of Karl's footer; modify this part -->


Now go to [making a personal site](user_site.html).
