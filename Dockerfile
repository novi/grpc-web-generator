FROM --platform=linux/amd64 ubuntu:22.04

ENV PROTOC_VER 21.12
ENV PROTOBUFJS_VER 3.21.2
ENV GPRCWEB_VER 1.4.2

#RUN apk add --no-cache curl libc6-compat libstdc++

RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install protoc
RUN cd /tmp && curl -OLs https://github.com/google/protobuf/releases/download/v${PROTOC_VER}/protoc-${PROTOC_VER}-linux-x86_64.zip && \
    unzip protoc-${PROTOC_VER}-linux-x86_64.zip && \
    cp -R include bin /usr/ && \
    rm -rf *

# Install js generator
RUN cd /tmp && curl -OLs https://github.com/protocolbuffers/protobuf-javascript/releases/download/v${PROTOBUFJS_VER}/protobuf-javascript-${PROTOBUFJS_VER}-linux-x86_64.zip && \
    unzip protobuf-javascript-${PROTOBUFJS_VER}-linux-x86_64.zip && \
    cp bin/protoc-gen-js /usr/sbin/ && \
    rm -rf *

# Install grpc-web generator
RUN curl -OLs https://github.com/grpc/grpc-web/releases/download/${GPRCWEB_VER}/protoc-gen-grpc-web-${GPRCWEB_VER}-linux-x86_64 && \
    mv protoc-gen-grpc-web-${GPRCWEB_VER}-linux-x86_64 /usr/sbin/protoc-gen-grpc-web && \
    chmod +x /usr/sbin/protoc-gen-grpc-web
