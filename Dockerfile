# FROM nvcr.io/nvidia/pytorch:19.12-py3
# FROM pytorch/pytorch:1.3-cuda10.1-cudnn7-devel
# FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-devel
FROM nvcr.io/nvidia/tensorrt:20.02-py3


ENV DEBIAN_FRONTEND=noninteractive
ADD requirements.txt .
RUN apt-get update && \
    apt-get install -y git gitk && \
    pip3 install -U pip && \
    pip3 install -r requirements.txt

# pytorch
RUN pip3 install torch===1.5.1 torchvision===0.6.1 -f https://download.pytorch.org/whl/torch_stable.html

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py --force-reinstall

# spconv
# ENV SPCONV_FORCE_BUILD_CUDA=1
RUN pip3 install cmake && \
    apt-get install -y libboost-all-dev
RUN git clone https://github.com/arke812/spconv.git --recursive && \
    cd spconv && \
    git checkout openpcdet_torch1.5 && \
    git submodule update --init --recursive && \
    python3 setup.py bdist_wheel && \
    cd dist && \
    pip3 install *.whl






RUN apt-get install -y sudo
ENV USER_NAME=docker
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME}
RUN chmod u+s /usr/sbin/useradd \
    && chmod u+s /usr/sbin/groupadd

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]






