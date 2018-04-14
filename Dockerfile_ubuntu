FROM ubuntu:xenial
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## References:
# https://github.com/xmrig/xmrig-amd
# https://github.com/calvintam236/docker_ubuntu

RUN \
	cd \
	&& dpkg --add-architecture i386 \
    && apt-get update \
#    && apt-get -y dist-upgrade 
    && apt-get --no-install-recommends install -y \
		ca-certificates curl xz-utils \
		build-essential cmake \
		libmicrohttpd-dev libuv1-dev ocl-icd-opencl-dev \
  \
    && curl -L -O --referer http://support.amd.com https://www2.ati.com/drivers/linux/beta/ubuntu/amdgpu-pro-17.40.2712-510357.tar.xz \
  \
    && tar -Jxvf amdgpu-pro-17.40.2712-510357.tar.xz \
    && rm amdgpu-pro-17.40.2712-510357.tar.xz \
    && bash ./amdgpu-pro-17.40.2712-510357/amdgpu-pro-install -y --compute \
    && rm -fR amdgpu-pro-17.40.2712-510357 \
  \
    && apt-get -y remove ca-certificates curl xz-utils build-essential cmake libmicrohttpd-dev libuv1-dev ocl-icd-opencl-dev \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -fR /var/lib/{apt,dpkg,cache,log}
