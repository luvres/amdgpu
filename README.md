## Ubuntu AMDGPU RX 550
-----

### Run

#### Clinfo
```
docker run -ti --rm --name AMGGPU \
--device=/dev/dri \
izone/amdgpu clinfo
```
#### Version
```
docker run -ti --rm --name AMGGPU \
--device=/dev/dri \
izone/amdgpu dpkg -l amdgpu-lib
```
```
docker run -ti --rm --name AMGGPU \
--device=/dev/dri \
izone/amdgpu:18.40 dpkg -l amdgpu
```

-----
#### Build
```
docker build -t izone/amdgpu .
```
```
docker build -t izone/amdgpu:18.40 -f Dockerfile_18.40-673869 .
```
