---
layout: page
title: Orechovka: jak mne to napadlo
---

This is what to do if you just want a website. (This page is a bit
long, but it's really not that much work.)

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
