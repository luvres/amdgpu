FROM ubuntu:bionic
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## Bionic 18.04
# https://drivers.amd.com/drivers/linux/amdgpu-pro-18.50-725072-ubuntu-18.04.tar.xz

RUN \
	amdgpu_version="amdgpu-pro-18.50-725072-ubuntu-18.04" \
	&& url="http://support.amd.com https://drivers.amd.com/drivers/linux/${amdgpu_version}.tar.xz" \
  \
	&& cd \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get --no-install-recommends install -y \
		ca-certificates curl xz-utils \
		clinfo \
  \
	&& curl -L -O --referer ${url} \
  \
	&& tar -Jxvf ${amdgpu_version}.tar.xz \
	&& rm ${amdgpu_version}.tar.xz \
	&& bash ./${amdgpu_version}/amdgpu-pro-install -y \
	&& rm -fR ${amdgpu_version} \
  \
	&& apt-get install -y opencl-amdgpu-pro \
  \
	&& apt-get -y remove \
		ca-certificates curl xz-utils \
  \
	&& echo "root:@p4sS_-_#sECURITy*Cre4t3+bigZone" | chpasswd \
	&& apt-get autoremove -y \
  \
	&& apt-get clean autoclean \
	&& rm -fR /var/lib/{apt,dpkg}

WORKDIR /root
