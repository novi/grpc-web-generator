FROM alpine

ENV PROTOC_VER 3.15.7
ENV GPRCWEB_VER 1.2.1

RUN apk add --no-cache curl protoc npm

# Install protoc
RUN cd /tmp && curl -s -O -L https://github.com/google/protobuf/releases/download/v${PROTOC_VER}/protoc-${PROTOC_VER}-linux-x86_64.zip && \
    unzip protoc-${PROTOC_VER}-linux-x86_64.zip && \
    mv include /usr/ && \
    rm -rf *

# Install grpc-web generator
RUN curl -OLs https://github.com/grpc/grpc-web/releases/download/${GPRCWEB_VER}/protoc-gen-grpc-web-${GPRCWEB_VER}-linux-x86_64 && \
    mv protoc-gen-grpc-web-${GPRCWEB_VER}-linux-x86_64 /usr/sbin/protoc-gen-grpc-web && \
    chmod +x /usr/sbin/protoc-gen-grpc-web

# Install protoc-gen-ts
RUN npm install -g ts-protoc-gen
