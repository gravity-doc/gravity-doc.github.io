---
sort: 1
---

# Software Installed
```note
On the *Gravity*, we use **`module`** to manage software and tools.
```

| **Command**                         | **Description**                                       |
| ------------------------------- | ------------------------------------------------- |
| `module avail / module av`      | see **available** software                        |
| `module list`                   | see software you have **loaded**                  |
| `module load <software_name>`   | load a software to your current shell environment |
| `module unload <software_name>` | remove software you don't need                    |
| `module purge`                  | remove **all** currently loaded software          |

## Available Software

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

Some libraries (in particular some C++ libraries) will only work properly with the compiler that is used to compile it. These modules will have the compiler version appended to the name, such as `hdf5/1.12.1-with-cxx-fortran-gcc10.2.0`
```

## Conda(Mamba)

Some users may prefer to use the anaconda python distribution.

```bash
module load anaconda/anaconda-mamba
```

Note you will have to unload any previously loaded python module if you see conflicts.

```tip
[mamba](https://mamba.readthedocs.io/en/latest/) is almost the same with [conda](https://docs.conda.io/projects/conda/en/latest/commands.html), but much super faster⚡! For example 🌰:
```

| mamba⚡                                   | conda                                    |
| ---------------------------------------- | ---------------------------------------- |
| `mamba search emcee`                     | `conda search emcee`                     |
| `mamba install -c conda-forge camb`      | `conda install -c conda-forge camb`      |
| `mamba create -n myenv python=3.9 scipy` | `conda create -n myenv python=3.9 scipy` |


### conda env
You can also use virtual env with anaconda, but the command is slightly different. To create and activate `myenv`

```bash
conda create -n myenv
source activate myenv
```

Note you will have to do `source activate` instead of `conda activate`.

To deactive,

```bash
conda deactivate
```

To see list of env,

```bash
conda env list
```


## Python

There is a system default python installation available if you do not load any module, which may already be able to meet your requirements. If you run into problems, you can try switching to another python module.

To see available python modules, use 

```bash
module av python
```

To load a specific python module, for example python-2.7.15, do

```bash
module load python/python-2.7.15
```

The system python modules already have the common python packages preconfigured. To see a list of already installed packages, do

```bash
pip list
```

If you need to install additional python packages, for example, `iminuit`, the easiest way is to use

```bash
pip install --user iminuit
```

## Virtual Environment

In some situations you may need different versions of a package that cannot be installed under the same python path. To solve the problem you can create a virtual environment to manage the conflict. Creating and activating a virtual env is like having a separate python installation so that you can install different collections of packages without affecting the base environment, but should be much easier to manage.

To create a virtual env named `myenv`,

```bash
virtualenv myenv
```
By default this will create an "virtual environment" under `myenv/` in your current directory. 

```warning
Currently the `virtualenv` command only works for python2. For python3 users, after loading the python3 module, you can create the virtualenv by 
`python3 -m venv myenv`
```

Once this is done, you can activate it by

```bash
source myenv/bin/activate
```

Once this is activated, you are now switched to a fresh python environment with only the most essential python packages visible to you. You can check the available packages by `pip list`. You can install new packages with `pip install`. Note you no longer need to use `--user` for installing in a virtualenv.

To exit from the virtual env, simply do

```bash
deactivate
```

## Axel
[Axel](https://github.com/axel-download-accelerator/axel) is a **multi-threaded** downloader. It is faster than `wget, curl`. It supports HTTP, HTTPS, FTP and FTPS protocols.

```bash
axel -n <threads number> <file link>
# For example 🌰, we use 8 threads to download ananconda installer
axel -n 8 https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
```

## References

* [virtualenv command options](https://virtualenv.pypa.io/en/latest/cli_interface.html)
* [python venv module](https://docs.python.org/3/library/venv.html)
* [conda env](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
* [Getting started with Conda](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html)
