#!/bin/bash

docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll --volume=$(pwd)/vendor/bundle:/usr/local/bundle -it -p 127.0.0.1:4000:4000 jekyll/jekyll jekyll serve -V -c _config_local.yml
