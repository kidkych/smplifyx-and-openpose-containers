FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip git locales libsm6 libxext6 libxrender-dev libglvnd0 libgl1 libglx0 \
    libegl1 libxext6 libx11-6 freeglut3-dev && pip3 install --upgrade pip setuptools

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir /home/repos && mkdir /home/data
WORKDIR /home/repos

RUN pip3 install git+https://github.com/nghorbani/configer git+https://github.com/nghorbani/human_body_prior

RUN git clone https://github.com/nghorbani/homogenus.git
COPY models/homogenus_v1_0/trained_models/tf /home/repos/homogenus/homogenus/trained_models/tf
RUN cd homogenus && pip3 install -r requirements.txt && python3 setup.py install

RUN git clone https://github.com/NVIDIA/cuda-samples.git
ENV CUDA_SAMPLES_INC /home/repos/cuda-samples/Common

RUN git clone https://github.com/vchoutas/torch-mesh-isect && cd torch-mesh-isect && \
    pip3 install -r requirements.txt && python3 setup.py install

RUN git clone https://github.com/vchoutas/smplx && cd smplx && python3 setup.py install
RUN git clone https://github.com/vchoutas/smplify-x.git && cd smplify-x && pip3 install -r requirements.txt && \
    pip3 install -r optional-requirements.txt


COPY models/smplx /home/repos/smplify-x/models/smplx
COPY models/vposer_v1_0 /home/repos/smplify-x/models/vposer_v1_0
COPY models/smplx_parts_segm.pkl /home/repos/smplify-x/models/smplx_parts_segm.pkl

WORKDIR /home
COPY scripts/container_entrypoint.sh /home/entrypoint.sh

ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

CMD bash entrypoint.sh

