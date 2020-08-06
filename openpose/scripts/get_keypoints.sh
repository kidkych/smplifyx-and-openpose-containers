#!/usr/bin/env bash

openpose=/home/repos/openpose/build/examples/openpose/openpose.bin

$openpose -image_dir /home/data/images --write_json /home/data/keypoints -display 0 --render_pose 0 --face --hand