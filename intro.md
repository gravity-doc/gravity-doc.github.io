---
sort: 1
---

# Introduction

![image](imgs/gravity.png)

## Login nodes
- 2 login nodes **login01** and **login02**
   - 2X Intel Gold 6240 CPU（2.6GHz,18C)
   - 192G memo.

## Computing nodes
- 36 compute nodes **gr01** - **gr36**
    - each node has 4X Intel Gold 6240 CPU (2.6GHz,18C), totally 72 cores.
    - each node has 384G memo.
    
- 1 fat node **fat01**
    - The fat node has 8X Intel Platinum 8268 CPU（2.9GHz，24C), totally 192 cores.
    - Totally, 192 cores, 6T memo，

## Storage
Parallel storage.

Total amount:4.2p

## Network



--- ipmi：硬件管理网络-千兆  ip网段（192.168.11.1）
--- 系统网络：计算节点采用千兆网络，存储节点采用万兆网络ip网段（192.168.10.1）
--- 计算网络：IB网网段（10.0.0.1）




