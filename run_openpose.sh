#!/usr/bin/env bash

if [ ! "$(ls -A data/images | grep -wv '^.gitkeep$')" ]
then
  echo "images directory under data should have at least one image"
  exit 9999
fi

cd openpose
docker build . -t openpose
cd ..

docker run --rm -it --gpus all \
  -v "$(pwd)"/data:/home/data \
  openpose:latest

sudo chown -R $(whoami):$(whoami) data