---
sort: 2
title: System Specs
---
# Hardware
<img src="./images/hardware.jpg" width = "300" height = "500" div align=center />

### Login nodes

- 2 *login* nodes: **login02** (primary) + **login01** (backup)
  - **36** cores (2x Intel Gold 6240 CPU, 2.6GHz, 18C) 
  - **187GB** memory

### Computing nodes

- 4 *GPU* nodes **gr01 ~ gr04**
  - gr01~gr03: **72** cores + **374GB** memory + NVIDIA Tesla **V100 (32GB)**
  - gr04: **72** cores + **374GB** memory + Nvidia Tesla **A100 (80GB)**

- 30 *normal* nodes **gr05 ~ gr34**
  - **72** cores + **374GB** memory (4x Intel Gold 6240 CPU 2.6GHz, 18C)

- 4 *fat* nodes
  - fat03 (gr35): **72** cores + **768GB** memory (4x Intel Gold 6240 CPU 2.6GHz, 18C)
  - fat02 (gr36): **72** cores + **3TB** memory (4x Intel Gold 6240 CPU 2.6GHz, 18C)
  - fat01: **192** cores + **6TB** memory (8x Intel Platinum 8268 CPU, 2.9GHz, 24C)
  - sgi: **256** cores + **4TB** memory (details below)

### Storage

- Inspur AS13000 parallel storage, with 20 nodes, inter-connected with a dual-10Gbps network
- Usable capacity 4.9PB (raw 6.3 PB, configured with 8:2 eraser code for redundancy)
- IO speed ~20GB/s

### Network

- computation network: Mellanox infiniband HDR configured at 100Gb/s
- internet: 10Gb/s connection to the internet through campus network


### SGI node 

The old SGI shared-memory server 

  - 32x Intel Xeon E5-4620 CPU (2.60GHz, 8C), total 256 cores
  - 4TB mem
  - ddn storage, usable capacity 657TB
  - connected to login02 through a 10Gbps cable, and to gravity through IB.
  - **new**: sgi account have been unified with gravity. On the login nodes, you can directly `ssh sgi`. Note the sgi environment is different from gravity, with different operating system (Suse linux enterprise 12) and different softwares installed.
