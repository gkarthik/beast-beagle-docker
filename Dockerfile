FROM nvidia/cuda:10.1-devel-ubuntu18.04
MAINTAINER gkarthik <gkarthik@scripps.edu>

WORKDIR /root/

RUN apt-get update -qq
RUN apt-get install -qq -y wget build-essential autoconf automake libtool git pkg-config openjdk-11-jdk vim ant

RUN git clone https://github.com/beagle-dev/beagle-lib.git && \
cd beagle-lib &&\
./autogen.sh && \
./configure --prefix=$HOME && \
make && \
make install && \
echo "export LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH" >> ~/.bashrc

ENV LD_LIBRARY_PATH $HOME/lib:$LD_LIBRARY_PATH
ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8

RUN wget https://github.com/beast-dev/beast-mcmc/releases/download/v1.10.5pre1/BEASTv1.10.5pre.tgz && \
tar xf BEASTv1.10.5pre.tgz && \
mv BEASTv1.10.5pre/bin/* /usr/local/bin && \
mv BEASTv1.10.5pre/lib/* /usr/local/lib && \
rm BEASTv1.10.5pre.tgz

RUN git clone -b ancestral_path https://github.com/beast-dev/beast-mcmc.git && \
cd beast-mcmc && \
ant

RUN git clone https://github.com/gkarthik/beast-beagle-docker.git

WORKDIR /root/beast-beagle-docker/
RUN chmod u+x run.sh

WORKDIR /data/
ENTRYPOINT ["/root/beast-beagle-docker/run.sh"]
