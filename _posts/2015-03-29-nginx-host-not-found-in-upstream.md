---
title: NGINX "host not found in upstream"
tags: [nginx, linux, network]
---

If you find lines like this in your nginx error.log and your nginx is not starting on a reboot, you might have a DNS/network problem:

{% highlight bash %}
2015/03/29 11:17:50 [emerg] 1482#0: host not found in upstream "xxxx.io" in /etc/nginx/sites-enabled/xxxx:12
2015/03/29 11:17:50 [emerg] 1483#0: host not found in upstream "xxxx.io" in /etc/nginx/sites-enabled/xxxx:12
2015/03/29 11:17:51 [emerg] 1504#0: host not found in upstream "xxxx.io" in /etc/nginx/sites-enabled/xxxx:12
{% endhighlight %}

Nginx with default values is started, before the network in completely up. My quickfix is to restart nginx after the network is available:

{% highlight bash %}
$ cat /etc/network/if-up.d/nginx
#!/bin/sh
 
/etc/init.d/nginx restart
{% endhighlight %}