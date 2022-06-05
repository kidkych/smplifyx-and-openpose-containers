# SMPLify-X and OpenPose Containers

## Introduction

This is a repo that provides Dockerfiles to build containers for [SMPLify-X](https://github.com/vchoutas/smplify-x) and 
[OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose). For more detailed setup instructions and alternate
use cases visit this [post on my website](https://kych.dev/blog/getting-started-with-open-pose-and-smp-lify-x/).

## Prerequisites

1. A Linux based OS 
2. A CUDA enabled GPU that supports CUDA 10
3. Sudo access
4. Docker set up such that you can passthrough GPUs to docker containers

The final point will require that you have [Docker 19.03.12](https://docs.docker.com/engine/install/) and the 
[NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker) installed.

## Usage

Once you have made sure you meet the prerequisites listed above you can clone the repo. Once you have the repo, you must
download the pretrained weights from [here](https://smpl-x.is.tue.mpg.de/downloads), you must make an account on
the site first. You will need to download the 
SMPL-X model, the VPoser model, and the Homogenus model. You will also need the `smplx_parts_segm.pkl` model from 
[here](https://owncloud.tuebingen.mpg.de/index.php/s/MWnr8Kso4K8T8at). The structure of the directory should look as 
follows:

```shell script
smplify-x/
    -> models/
      -> homogenus_v1_0/*
      -> smplx/*        
      -> vposer_v1_0/*        
      -> smplx_parts_segm.pkl
```

Once you have the model weights downloaded and stored in the correct directory, just place images you wish to get 3D
body models from in the `data/images` directory. Then simply run the `run_both.sh` script. On your first run since the
Docker images need to be built, you will have to wait 20-30 minutes for the process to complete. Both the 
`run_openpose.sh` and `run_smplifyx.sh` scripts can also be run independently. Usage is as follows:

```shell script
$ git clone https://github.com/kidkych/smplifyx-and-openpose-containers

$ cd smplifyx-and-openpose-containers

# Make sure the necessary files are downloaded and placed in smplify-x/models
# and place images of interest into data/images now

$ ./run_both.sh
```
