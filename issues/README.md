---
sort: 30
title: Known Issues
---

## 日志残留问题
  
  问题描述:当用户提交两个节点以上的任务时，就会出现日志残留问题。
  ```bash
  [inspur@login02 gr01]$ cat inspur-test-3.e2619
    cgdelete: cannot remove group 'gr28.2619.login01': No such file or directory
  ```
  此问题涉及内核模块cgroup，不会影响作业的正常运行，用户遇到该问题可暂时忽略，目前仍在定位问题。
  
## compiler/intel-2020 module无法使用的问题

  目前intel2020跟module适配存在问题，使用module load compiler/intel-2020载入环境变量无法生效。
  
  如果需要使用intel2020，可以直接写source路径，或者通过source载入。

  ```bash
  source /opt/intel-2020.sh
  ```

## Anaconda

One recieves 'binary file can not be executed' after installing of Anaconda latest version (2020-05). 
The same happens when update conda from old version.

This issue is due to incompatiblity of the parallel file system mounted in kernel state. 

As a temporary workaround, we have mounted the filesystem with NFS on login02, so that you can use login02 for installation and update of anaconda packages. This means degraded IO performance on login02 (~700MB/s), but it should suffice common usage requirements. If high IO performance is needed interactively, use login01.

## openmpi-4.0.4

High version *openmpi* use UCX (Unified Communication X) as the default pml (Physical Markup Language).
You need to specify this in the running command.
```bash
mpirun -np 4 --mca pml ucx ./a.out
```
[For more details.]{https://github.com/openucx/ucx/wiki/OpenMPI-and-OpenSHMEM-installation-with-UCX}
