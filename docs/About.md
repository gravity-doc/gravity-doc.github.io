---
sort: 2
title: System Specs
---
# Hardware
<img src="./images/hardware.jpg" width = "300" height = "500" div align=center />

### Login nodes

- 2 login nodes **login02** (primary) and **login01** (backup)
  - 2x Intel Gold 6240 CPU（2.6GHz, 18C)
  - 187G memory

### Computing nodes

- 36 compute nodes **gr01** ~ **gr36**
  - each node has 4x Intel Gold 6240 CPU (2.6GHz, 18C), 72 cores in total
  - each node has 374G memory

- 4 fat nodes
  - fat01: 8x Intel Platinum 8268 CPU（2.9GHz，24C), 192 cores total; 6TB memory
  - fat02 (gr36): 72Cores, 3TB mem
  - fat03 (gr35): 72Cores, 768GB mem
  - sgi: 256 cores, 4TB mem (see below)
  
- 4 GPU nodes **gr01-gr04**
  - each node has 1 *NVIDIA Tesla V100s PCIe 32 GB card*, together with 4X Intel Gold 6240 CPU (2.6GHz,18C)

### Storage

- Inspur AS13000 parallel storage, with 17 nodes, inter-connected with a dual-10Gbps network
- Usable capacity 4.2PB (raw 5.3PB, configured with 8:2 eraser code for redundancy)
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
