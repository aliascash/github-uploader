FROM debian:stretch
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV GO_VERSION="1.10.3.linux-amd64"

RUN apt-get update -y \
 && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    mc \
    wget

RUN wget https://dl.google.com/go/go${GO_VERSION}.tar.gz \
 && tar -xvf go${GO_VERSION}.tar.gz \
 && mv go /usr/local \
 && rm -f go${GO_VERSION}.tar.gz

RUN export GOROOT=/usr/local/go \
 && export GOPATH=$HOME/Projects/Proj1 \
 && export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN go version
