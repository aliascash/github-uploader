FROM golang:1.11-rc-alpine3.7
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV GITHUB_TOKEN=1234567890

RUN apk add git \
 && go version \
 && go get github.com/aktau/github-release

RUN github-release --help
