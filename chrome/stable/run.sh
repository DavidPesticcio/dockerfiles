#!/bin/bash

docker run -it --rm \
  --net host \
  --cpuset-cpus 0 \
  --memory 512mb \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -v $HOME/Downloads:/home/chrome/Downloads \
  -v $HOME/.config/google-chrome/:/data \
  --security-opt seccomp=$HOME/chrome.json \
  --device /dev/snd \
  --device /dev/dri \
  -v /dev/shm:/dev/shm \
  --name chrome \
  chrome

#
# You will want the custom seccomp profile:
#   wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json

