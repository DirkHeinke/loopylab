---
title: Archlinux - Big Cursor
tags: [linux, xmonad, archlinux]
---

After the last archlinux update, my cursor was about 3 to 4 times bigger than normal. First it only occurred in skype, but after a reboot it affected the cursor everywhere.

After searching a bit I found [this](https://bbs.archlinux.org/viewtopic.php?pid=1467825) post in the Arch Linux forum. The most practical answer is to comment out the Inherits=Adwaita, which is set through new dependencies:


{% highlight bash %}
$ nano /usr/share/icons/default/index.theme

[Icon Theme]
#Inherits=Adwaita
{% endhighlight %}

Then restart X and your cursor should be normal again. The problem only occurs, when no other theme is set, so it's likely that only users with basic/uncommon display environments are affected (like in my case xmonad).