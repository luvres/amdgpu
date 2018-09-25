## Ubuntu AMDGPU RX 550
-----

### Run

#### Clinfo
```
docker run -ti --rm --name AMGGPU \
--device /dev/dri \
izone/amdgpu clinfo
```
#### Version
```
docker run -ti --rm --name AMGGPU \
--device /dev/dri \
izone/amdgpu dpkg -l amdgpu
```

-----
#### Build
```
docker build -t izone/amdgpu .
```
```
docker build -t izone/amdgpu:18.30-641594 .
```

