## Ubuntu AMDGPU RX 550
-----

### Run

#### Clinfo
```
docker run --rm --name AMGGPU \
--device=/dev/dri \
-ti izone/amdgpu clinfo
```
```
docker run --rm --name AMGGPU \
--device=/dev/dri \
-ti izone/amdgpu:opencl clinfo
```
```
docker run --rm --name NVIDIA \
--runtime=nvidia \
-ti izone/amdgpu:opencl clinfo
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
izone/amdgpu:18.50 dpkg -l amdgpu
```

-----
#### Build
```
docker build -t izone/amdgpu .
```
```
docker build -t izone/amdgpu:18.50 -f Dockerfile_18.50-725072 .
```
```
docker build -t izone/amdgpu:18.50 -f Dockerfile_nvidia .
```
```
docker build -t izone/amdgpu:opencl -f Dockerfile_opencl .
```


