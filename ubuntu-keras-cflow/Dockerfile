FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
ARG PYTHON_VERSION=3.7

RUN apt-get update && apt-get install -y --no-install-recommends \
build-essential cmake git curl wget ca-certificates && \
rm -rf /var/lib/apt/lists/*

RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh -O ~/miniconda.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install -y python=$PYTHON_VERSION numpy pyyaml scipy ipython mkl mkl-include ninja cython typing\
      pytorch torchvision cudatoolkit=10.1 -c pytorch&& \
     /opt/conda/bin/conda clean -ya

ENV PATH /opt/conda/bin:$PATH

RUN pip install pandas gensim==3.8.3 scikit-learn==0.22.2.post1 cvxpy matplotlib tensorflow==1.13.1 keras==2.2.4 nltk==3.4.5 h5py==2.10.0 pytrec_eval pyltr

RUN wget https://gnu.mirror.constant.com/cflow/cflow-latest.tar.bz2 && tar -xf cflow-latest.tar.bz2 && rm cflow-latest.tar.bz2 && \
cd cflow-1.6 && ./configure && make && make install && cd /

ENV TZ=America/New_York
RUN echo $TZ > /etc/timezone && \
apt-get update && apt-get install -y tzdata && \
rm /etc/localtime && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata && \
apt-get clean

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

RUN rm -rf cflow-1.6 

RUN apt-get install -y zip sudo && useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN git clone https://github.com/ShiftLeftSecurity/joern && cd joern && sudo ./joern-install.sh && cd /  && apt-get clean

RUN chmod 755 /root