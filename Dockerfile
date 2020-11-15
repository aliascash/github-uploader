# SPDX-FileCopyrightText: © 2020 Alias Developers
# SPDX-FileCopyrightText: © 2016 SpectreCoin Developers
#
# SPDX-License-Identifier: MIT

FROM golang:1.11.2-alpine3.7
MAINTAINER HLXEasy <hlxeasy@gmail.com>

RUN apk add git \
 && go version \
 && go get github.com/aktau/github-release

RUN github-release --help

# Create mountpoint for file to upload
RUN mkdir /filesToUpload
