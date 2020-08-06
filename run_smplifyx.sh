#!/usr/bin/env bash

if [ ! -d "outputs" ]
then
  mkdir outputs
fi

if [ ! "$(ls -A data/keypoints | grep -wv '^.gitkeep$')" ]
then
  echo "data/keypoints directory must contain .json files corresponding to images in data/images"
  exit 9999
fi

cd smplify-x
docker build . -t smplifyx_container
cd ..

sudo xhost +local:root

docker run --rm -it --gpus all -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 \
  -v "$(pwd)"/data:/home/data \
  -v "$(pwd)"/outputs:/home/outputs \
  smplifyx_container:latest

sudo chown -R $(whoami):$(whoami) outputs