FROM woffee/keras:cflow_joern3

RUN pip install dask networkx clang

RUN apt-get update && apt-get install -y clang-8 && rm -rf /var/lib/apt/lists/*

RUN pip install tensorboardX

RUN pip install torch-scatter torch-sparse torch-cluster torch-spline-conv torch-geometric -f https://pytorch-geometric.com/whl/torch-1.8.0+cu101.html


# # python clang bindings
# RUN wget --output-document=/tmp/clang-source.tar.xz \
#     "http://releases.llvm.org/$(llvm-config --version)/cfe-$(llvm-config --version).src.tar.xz"
# RUN tar --extract --xz --file="/tmp/clang-source.tar.xz"
# RUN mv "/cfe-$(llvm-config --version).src" "/clang-source"
# ENV PYTHONPATH "${PYTHONPATH}:/clang-source/bindings/python"

