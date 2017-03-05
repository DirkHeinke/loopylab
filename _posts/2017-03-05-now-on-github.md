---
title: jekyll, github and travis-ci
tags: [jekyll, docker, cd]
---

The source of this blog is now available at [github](https://github.com/DirkHeinke/loopylab). Also I'm now using travis-ci to generate the static files and deploy them to my server. Stuff I found out:

## travis-ci language

If you use docker to run your commands, the language you specify in the `travis.yml` file doesn't really matter.


## ssh-key for scp

My deploy script uses scp, so travis needs access to my server. For that, I created a new ssh-key:
{% highlight bash %}
ssh-keygen -t rsa -b 4096 -C "Travis CI loopylab" -f travis_loopylab_key
{% endhighlight %}

Then added the public part to my server and encrypted the private part with the travis cli:
{% highlight bash %}
travis encrypt-file travis_loopylab_key
{% endhighlight %}

The newly generated file can be pushed to your repository and no one can readout the key (hopefully).

Now just add the following lines to your `travis.yml`:

{% highlight yaml %}
addons:
    ssh_known_hosts: dirkheinke.de
[...]
before_deploy:
    - eval "$(ssh-agent -s)"
    - openssl aes-256-cbc -K ... # use the output of the travis cli
    - chmod 600 /tmp/travis_loopylab_key
    - ssh-add /tmp/travis_loopylab_key

deploy:
    skip_cleanup: true
    provider: script
    script: ./_deploy.sh
    on:
        branch: master

{% endhighlight %}

You can find my full `travis.yml` [here](https://github.com/DirkHeinke/loopylab/blob/master/.travis.yml)

PS: Don't try to put the private key in a environment variable from travis, because the line breaks are important for ssh.

## docker in travis-ci
You can use docker commands in every part of the `travis.yml` file, even if the documentation only mentions the `before_install` part.
