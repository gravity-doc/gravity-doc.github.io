---
sort: 2
title: Issues
---

# Issues

```note
If there is **NO** solution of your problem, feel free to [contact us](https://gravity-doc.github.io/#Contact)!
```

```danger
**NEVER EVER** install/update any package at *login01* using `conda/mamba`. Otherwise, your whole conda environment will be destroyed!   
- You can use `pip install` instead   
- You can go to *login02* to use `conda/mamba`   
```

## **Conda**   
One recieves '**binary file can not be executed**' after installing of Anaconda latest version (2020-05). 
The same happens when update conda from old version.
This issue is due to incompatiblity of the **parallel file system** mounted in kernel state. 
As a temporary workaround, we have mounted the filesystem with **NFS on login02**, so that you can use login02 for installation and update of anaconda packages. This means degraded IO performance on login02 (~700MB/s), but it should suffice common usage requirements. If high IO performance is needed interactively, use login01.

## hdf5 file open failure on login02
When opening a hdf5 file on login02, one may sometimes run into the following error
using python:

```
----> 1 f=h5py.File('snap_001.0.hdf5','r')
IOError: Unable to open file (unable to lock file, errno = 37, error message = 'No locks available')
```

or using `h5ls`:

```
[user@login02]$ h5ls snap_001.0.hdf5 
snap_001.0.hdf5: unable to open file
```

This is a known problem in the NFS file system on `login02`. You can switch to read the file on `login01` instead.

```warning
Alternatively, you may choose to disable hdf5 file locking before reading, by setting the environment variable `HDF5_USE_FILE_LOCKING` to `FALSE`, e.g., in bash:

 `export HDF5_USE_FILE_LOCKING=FALSE`

This will disable hdf5 file locking, but you will have to be more careful about opening files to avoid problematic access patterns (i.e.: multiple writers to the same hdf5 file) that the file locking was designed to prevent. 
```

## **日志残留问题**        

  问题描述:当用户提交两个节点以上的任务时，就会出现日志残留问题。

  ```bash
  [inspur@login02 gr01]$ cat inspur-test-3.e2619
  cgdelete: cannot remove group 'gr28.2619.login01': No such file or directory
  ```

  此问题涉及内核模块cgroup，不会影响作业的正常运行，用户遇到该问题可暂时忽略，目前仍在定位问题。

- **compiler/intel-2020 module无法使用的问题**     
  目前intel2020跟module适配存在问题，使用module load compiler/intel-2020载入环境变量无法生效。

  如果需要使用intel2020，可以直接写source路径，或者通过source载入。

  ```bash
  source /opt/intel-2020.sh
  ```

## **openmpi-4.0.4**     
High version *openmpi* use UCX (Unified Communication X) as the default pml (Physical Markup Language).
You need to specify this in the running command.

```bash
mpirun -np 4 --mca pml ucx ./a.out
```

You may run into error/warning messages regarding openib, such as 
```
By default, for Open MPI 4.0 and later, infiniband ports on a device
are not used by default.  The intent is to use UCX for these devices.
You can override this policy by setting the btl_openib_allow_ib MCA parameter
to true.

WARNING: There was an error initializing an OpenFabrics device.
[login02:780991] 3 more processes have sent help message help-mpi-btl-openib.txt / ib port not selected
[login02:780991] 3 more processes have sent help message help-mpi-btl-openib.txt / error in device init
```
These are because the openmpi has been configured with the deprecated openib (which is nowadays superceded by openfabric). To avoid these messages, you can disable openib when using mpirun,
```bash
mpirun -np 4 --mca btl "^openib" ./a.out
```


[see more](https://github.com/openucx/ucx/wiki/OpenMPI-and-OpenSHMEM-installation-with-UCX)

## **performance issue on fat01**   
The current hardware architecture of fat01 has a limited memory bandwidth which could become a bottleneck for memory intensive jobs. For example, for large memory (e.g., >2TB) OpenMP jobs, it may take longer to run using 48 or more cores than using 24 cores. When the memory usage of the system is high, the overall performance of the system will also degrade. One may also experience very slow IO speed under such situations. So it is advised to first do some test runs to pick an optimal number of threads to use. 
