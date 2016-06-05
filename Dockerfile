FROM debian:jessie
MAINTAINER Corey Porter <coreyaporter@gmail.com>

ENV DC=/usr/local/bin/ldc2

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        binutils.gold build-essential ca-certificates curl git llvm-3.5 xz-utils && \
    update-alternatives --install "/usr/bin/ld" "ld" "/usr/bin/ld.gold" 20 && \
    rm -fr /var/cache/apt && \
    curl -L https://github.com/ldc-developers/ldc/releases/download/v1.0.0-beta2/ldc2-1.0.0-beta2-linux-x86_64.tar.xz | tar Jxf - -C /usr/local --strip-components=1 && \
    curl -L http://code.dlang.org/files/dub-0.9.25-linux-x86_64.tar.gz | tar xfz - -C /usr/local/bin
