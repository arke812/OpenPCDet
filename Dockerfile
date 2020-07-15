# FROM nvcr.io/nvidia/pytorch:19.12-py3
FROM pytorch/pytorch:1.3-cuda10.1-cudnn7-devel

ENV DEBIAN_FRONTEND=noninteractive
ADD requirements.txt .
RUN apt-get update && \
    apt-get install -y git gitk && \
    pip install -U pip && \
    pip install -r requirements.txt

# spconv
RUN pip install cmake && \
    apt-get install -y libboost-all-dev
RUN git clone https://github.com/traveller59/spconv.git --recursive && \
    cd spconv && \
    git checkout 8da6f96 && \
    git submodule update --init --recursive && \
    python setup.py bdist_wheel && \
    cd dist && \
    pip install *.whl







# RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
#     PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
#     GIT_CLONE="git clone --depth 10" && \
#     rm -rf /var/lib/apt/lists/* \
#            /etc/apt/sources.list.d/cuda.list \
#            /etc/apt/sources.list.d/nvidia-ml.list && \
#     apt-get update && \
# # ==================================================================
# # tools
# # ------------------------------------------------------------------
#     DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
#         build-essential \
#         ca-certificates \
#         cmake \
#         wget \
#         git \
#         vim \
#         fish \
#         libsparsehash-dev \
#         && \
# # ==================================================================
# # python
# # ------------------------------------------------------------------
#     DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
#         software-properties-common \
#         && \
#     add-apt-repository ppa:deadsnakes/ppa && \
#     apt-get update && \
#     DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
#         python3.6 \
#         python3.6-dev \
#         && \
#     wget -O ~/get-pip.py \
#         https://bootstrap.pypa.io/get-pip.py && \
#     python3.6 ~/get-pip.py && \
#     ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
#     ln -s /usr/bin/python3.6 /usr/local/bin/python && \
#     $PIP_INSTALL \
#         setuptools \
#         && \
#     $PIP_INSTALL \
#         numpy \
#         scipy \
#         matplotlib \
#         Cython \
#         && \
# # ==================================================================
# # pytorch
# # ------------------------------------------------------------------
#     $PIP_INSTALL \
#         torch_nightly -f \
#         https://download.pytorch.org/whl/nightly/cu90/torch_nightly.html \
#         && \
#     $PIP_INSTALL \
#         torchvision_nightly \
#         && \
# # ==================================================================
# # config & cleanup
# # ------------------------------------------------------------------
#     ldconfig && \
#     apt-get clean && \
#     apt-get autoremove && \
#     rm -rf /var/lib/apt/lists/* /tmp/* ~/*













