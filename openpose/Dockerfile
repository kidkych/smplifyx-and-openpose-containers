FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && apt-get install -y autoconf automake libtool curl \
    make g++ unzip git locales sudo wget libssl-dev libopencv-dev libgoogle-glog-dev

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir /home/repos
WORKDIR /home/repos

RUN git clone https://github.com/google/protobuf.git && cd protobuf && git submodule update --init --recursive && \
    ./autogen.sh && ./configure && make && make check && make install && ldconfig

RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.6/cmake-3.15.6.tar.gz && \
    tar -xvf cmake-3.15.6.tar.gz && rm cmake-3.15.6.tar.gz && cd cmake-3.15.6 && ./configure && ./bootstrap && \
    make -j`nproc` && make install -j`nproc`

RUN git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git && cd openpose && \
    bash scripts/ubuntu/install_deps.sh

RUN cd openpose && git submodule update --init --recursive && mkdir build && cd build && cmake .. && \
    make -j`nproc`

RUN echo 'alias openpose="/home/repos/openpose/build/examples/openpose/openpose.bin"' >> ~/.bashrc

WORKDIR /home/repos/openpose

COPY scripts/get_keypoints.sh .
CMD bash get_keypoints.sh
