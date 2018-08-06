## Ubuntu AMDGPU RX 550
-----

### Run

#### clinfo
```
docker run -ti --rm --name AMGGPU \
--device /dev/kfd \
--device /dev/dri \
izone/amdgpu clinfo
```
```
```
```
docker run -ti --rm --name AMGGPU \
--device /dev/kfd \
--device /dev/dri \
izone/amdgpu bash
```

-----
#### Build
```
docker build -t izone/amdgpu .
```
```
docker build -t izone/amdgpu:17.40.2712 .
```
```
docker build -t izone/amdgpu:18.20-606296 .
```

