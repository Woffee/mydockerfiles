FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
ARG PYTHON_VERSION=3.7
ENV TZ=America/New_York
ENV PATH /opt/conda/bin:$PATH
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake  git  curl wget ca-certificates dos2unix tzdata clang llvm swig swi-prolog graphviz gcc-5 openjdk-8-jdk && \
    cd /opt && git clone https://github.com/Woffee/joern.git && \
    cd ~ && wget https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh -O ~/miniconda.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda install -y python=$PYTHON_VERSION numpy && \
    pip install pandas && \ 
    echo $TZ > /etc/timezone && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    /opt/conda/bin/conda clean -ya && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
