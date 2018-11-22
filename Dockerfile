FROM nvidia/cuda:9.2-base
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## Bionic 18.04
# https://www2.ati.com/drivers/linux/ubuntu/18.04/amdgpu-pro-18.20-606296.tar.xz
# https://www2.ati.com/drivers/linux/ubuntu/18.04/amdgpu-pro-18.30-641594.tar.xz
## Xenial 16.04
# https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-18.20-606296.tar.xz
# https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-18.30-641594.tar.xz

RUN \
    amdgpu_version="amdgpu-pro-18.40-673869-ubuntu-16.04" \
    && url="http://support.amd.com https://drivers.amd.com/drivers/linux/${amdgpu_version}.tar.xz" \
  \
	&& cd \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get --no-install-recommends install -y \
		ca-certificates curl xz-utils clinfo \
		build-essential cmake \
		libmicrohttpd-dev libuv1-dev ocl-icd-opencl-dev \
  \
	&& curl -L -O --referer ${url} \
  \
	&& tar -Jxvf ${amdgpu_version}.tar.xz \
	&& rm ${amdgpu_version}.tar.xz \
	&& bash ./${amdgpu_version}/amdgpu-pro-install -y --compute \
	&& rm -fR ${amdgpu_version} \
  \
	&& apt-get -y remove \
        ca-certificates curl xz-utils build-essential cmake \
        libmicrohttpd-dev libuv1-dev ocl-icd-opencl-dev \
	&& apt-get -y autoremove \
	&& apt-get clean autoclean \
	&& rm -fR /var/lib/{apt,dpkg,cache,log}

WORKDIR /root
