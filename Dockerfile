# Copyright (c) 2019, NVIDIA Corporation. All rights reserved.
#
# This work is made available under the Nvidia Source Code License-NC.
# To view a copy of this license, visit
# https://nvlabs.github.io/stylegan2/license.html

FROM tensorflow/tensorflow:1.15.0-gpu-py3

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends python3-pip python3-tk python2.7

RUN pip install sklearn matplotlib natsort ipython seaborn

#RUN pip install scipy==1.3.3
#RUN pip install requests==2.22.0
#RUN pip install Pillow==6.2.1

RUN pip install numpy==1.13.3
RUN pip install scipy==1.0.0
RUN pip install tensorflow-gpu==1.6.0
RUN pip install moviepy==0.2.3.2
RUN pip install Pillow==3.1.1
RUN pip install lmdb==0.93
RUN pip install opencv-python==3.4.0.12
RUN pip install cryptography==2.1.4
RUN pip install h5py==2.7.1
RUN pip install six==1.11.0

WORKDIR /data

## 
##  1. build up a docker container
##  docker build . < Dockerfile -t shenghh2020/proGAN_tf:latest -t shenghh2020/proGAN_tf:1.0
##  2. push the docker container to the docker hub
##  docker push shenghh2020/proGAN_tf:latest 
##  docker push shenghh2020/proGAN_tf:1.0
##  3. qsub a job to the v100_cluster
##  bsub -Is -G compute-anastasio -q anastasio-interactive -a 'docker(shenghh2020/proGAN_tf:latest)' -gpu "num=4" /bin/bash
##  when the access permission is required, use the following command:
##
## docker login -u "myusername" -p "mypassword" docker.io
## docker push myusername/myimage:0.0.1
###
