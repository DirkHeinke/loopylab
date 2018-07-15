---
layout: default
title: Jekyll, Travis, Docker - permissions denied
tags:
- travis-ci
- jekyll
- docker
---

After trying to redeploy my blog with travis, the build failed with this message:
```
[...]
jekyll 3.8.3 | Error:  Permission denied @ dir_s_mkdir - /srv/jekyll/_site
```

The problem was, that travis set permissions for uid 2000, but the container runs with uid 1000. Adding write permissions to the folder allows jekyll to create a new folder and write the output. My docker run command now looks like this:
```
docker run --rm --volume=$(pwd):/srv/jekyll jekyll/jekyll /bin/bash -c "chmod a+wx . && jekyll build -V"
```