FROM nvidia/cuda:9.2-base
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## References:
# https://github.com/xmrig/xmrig-amd
# https://github.com/calvintam236/docker_ubuntu
## Bionic 18.04
# https://www2.ati.com/drivers/linux/ubuntu/18.04/amdgpu-pro-18.20-606296.tar.xz
## Xenial 16.04
# https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-18.20-606296.tar.xz

RUN \
	cd \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get --no-install-recommends install -y \
		ca-certificates curl xz-utils clinfo \
		build-essential cmake \
		libmicrohttpd-dev libuv1-dev ocl-icd-opencl-dev \
  \
	&& curl -L -O --referer http://support.amd.com https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-18.20-606296.tar.xz \
  \
	&& tar -Jxvf amdgpu-pro-18.20-606296.tar.xz \
	&& rm amdgpu-pro-18.20-606296.tar.xz \
	&& bash ./amdgpu-pro-18.20-606296/amdgpu-pro-install -y --compute \
	&& rm -fR amdgpu-pro-18.20-606296 \
  \
	&& apt-get -y remove ca-certificates curl xz-utils build-essential cmake libmicrohttpd-dev libuv1-dev ocl-icd-opencl-dev \
	&& apt-get -y autoremove \
	&& apt-get clean autoclean \
	&& rm -fR /var/lib/{apt,dpkg,cache,log}

WORKDIR /root
