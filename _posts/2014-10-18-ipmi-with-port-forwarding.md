---
title: IPMI with port forwarding
tags: [linux, network, ssh, ipmi]
---

I recently had the problem, that the IPMI virtual console was not working on one of my servers.

After searching the problem in icedtea I discovered errors while downloading files:

{% highlight bash %}
...
JAR https://localhost:443/liblinux_x86_64.jar not found. Continuing.
...
JAR https://localhost:443/iKVM.jar not found. Continuing.
...
{% endhighlight %}
I missed that the console works on other ports than 80 and that was the only forwarded port. So I changed my ssh command line to forward all IPMI ports:

{% highlight bash %}
sudo ssh -L 80:192.168.205.115:80 -L 443:192.168.205.115:443 \
  -L 623:192.168.205.115:623 -L 5900:192.168.205.115:5900 root@example.com
{% endhighlight %}