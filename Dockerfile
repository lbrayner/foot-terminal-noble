FROM ubuntu:noble

ARG DEBIAN_FRONTEND=noninteractive

# Installing meson and ninja first for optimal intermediary cached images
RUN apt-get update
RUN apt-get -y install pipx
RUN pipx install meson ninja
ENV PATH="$PATH:/root/.local/bin"

RUN apt-get -y install \
        git \
        build-essential \
        pkg-config \
        bison \
        libxcb-xkb-dev \
        libxml2-dev \
        wayland-protocols \
        libwayland-dev \
        libpixman-1-dev \
        libfontconfig1-dev \
        libxkbcommon-dev

RUN git clone https://codeberg.org/dnkl/foot /foot && mkdir /foot/build

WORKDIR /foot
RUN git checkout 1.27.0

RUN ./pgo/pgo.sh auto . build
