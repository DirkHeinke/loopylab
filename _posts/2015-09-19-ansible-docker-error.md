---
title: Ansible Docker - Docker API Error
tags: [docker, ansible]
---

If you try to run a playbook with the ansible-docker plugin, and you get an error like this

{% highlight bash %}
failed: [192.168.2.xxx] => {"changed": false, "failed": true}
msg: Docker API Error: client and server don't have same version (client : 1.19, server: 1.18)

FATAL: all hosts have already failed -- aborting
{% endhighlight %}

# Solution

You can set the api version to a fixed version. The better way is to use the “auto” feature from docker-py:

{% highlight yaml %}
- name: start ....
    docker:
      docker_api_version: auto
      image: ....
{% endhighlight %}