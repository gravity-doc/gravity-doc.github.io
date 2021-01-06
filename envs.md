---
sort: 6
---

# Available Software

**Gravity** provides **module environment** to manage frequently used softwares and libraries.  

Use `module avail` to check the available softwares/libraries.
```bash
[testuser@GRAVITY:~]:module avail

---------------------------------- /usr/share/Modules/modulefiles -----------------------------------
dot         module-git  module-info modules     null        use.own

-------------------------------------- /opt/module/modulefiles --------------------------------------
anaconda/anaconda3     ds9/ds9.8.1            hdf5-threadsafe/1.12.0 mpi/openmpi-4.0.4
boost/1_73_0           fftw/2.1.5             HDFView/3.1.1          mpi/openmpi-4.0.5
cfitsio/3.48           fftw/2.1.5.v1          Healpix/3.60           python/python-2.7.18
cloudy/17.02           fftw/3.3.8             heasoft/6.27.2         python/python-3.8.5
cmake/3.18.2           gadgetviewer/1.1.0     miniconda/miniconda3   swig/4.0.1
compiler/2020          gnuastro/0.12          mkl/intel-mkl          valgrind/3.15.0
compiler/intel-2018    gsl/2.5                mpi/intel-2018         wcslib/7.3
compiler/intel-2018u3  hdf5/1.12.0            mpi/mpich-3.2.1
compiler/intel-2020    hdf5-parallel/1.12.0   mpi/openmpi-3.1.1
```

Use `module load ABC` to load the softwares/libraries you need.

Use `module list` to check the list of all the module loaded.

Use `module unload ABC` to unload one specific module.  `module purge` can be used to unload all the modules.

module purge/load/unload/list:完整的模块工作流程

在开始新作业之前，先卸载所有已加载的模块是一个好习惯。
```bash
$ mdoule purge
```

可以一次加载或卸载多个模块

```bash
$ module load python/python-3.8.5
$ module unload python/python-3.8.5
```

您还可以在工作中的任何时间查看加载的模块

```bash
$ mdoule list
```

```tip
The order of the module loading matters if some of them have dependence on others.
```






