FROM base/devel
RUN pacman -Sy --noconfirm cmake ninja git

# python 3
RUN pacman -Sy --noconfirm python python-numpy python-pyaml python-setuptools python-cffi python-pip
RUN pip install mkl mkl-include cmake typing ninja

# python 2
RUN pacman -Sy --noconfirm python2 python2-numpy python2-pyaml python2-setuptools python2-cffi python2-pip python2-typing python2-enum34
RUN pip2 install mkl mkl-include cmake

RUN git clone --depth=1 https://github.com/pytorch/pytorch.git
RUN cd pytorch && git submodule update --init

# python 3
RUN cd pytorch && python setup.py install && pip install pytorch-ignite
# python 2
RUN cd pytorch && python2 setup.py clean install && pip2 install pytorch-ignite

