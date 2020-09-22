---
sort: 1
---
# Python
## Python Modules
There is a system default python installation available if you do not load any module, which may already be able to meet your requirements. If you run into problems, you can try switching to another python module.

To see available python modules, use 
```
module av python
```

To load a specific python module, for example python-2.7.15, do

```
module load python/python-2.7.15
```

The system python modules already have the common python packages preconfigured. To see a list of already installed pacakages, do

```
pip list
```

If you need to install additional python packages, for example, `iminuit`, the easiest way is to use

```
pip install --user iminuit
```

## Virtual env

In some situations you may need different versions of a package that cannot be installed under the same python path. To solve the problem you can create a virtual environment to manage the conflict. Creating and activating a virtual env is like having a separate python installation so that you can install different collections of packages without affecting the base environment, but should be much easier to manage.

To create a virtual env named `myenv`,

```
virtualenv myenv
```
By default this will create an "virtual environment" under `myenv/` in your current directory. 
  
.. warning::

   Currently the `virtualenv` command only works for python2. For python3 users, after loading the python3 module, you can create the virtualenv by 

   ```
   python3 -m venv myenv
   ```

Once this is done, you can activate it by
```
source myenv/bin/activate
```

Once this is activated, you are now switched to a fresh python environment with only the most essential python packages visible to you. You can check the available packages by `pip list`. You can install new packages with ```pip install```. Note you no longer need to use ```--user``` for installing in a virtualenv.

To exit from the virtualenv, simply do

```
deactivate
```


## Anaconda

Some users may prefer to use the anaconda python distribution. To use anaconda,

```
module load anaconda
```

Note you will have to unload any previously loaded python module if you see conflicts.

### conda env
You can also use virtual env with anaconda, but the command is slightly different. To create and activate `myenv`

```
conda create -n myenv
source activate myenv
```
Note you will have to do `source activate` instead of `conda activate`.

To deactive,
```
conda deactivate
```

To see list of env,

```
conda env list
```

## References

* [virtualenv command options](https://virtualenv.pypa.io/en/latest/cli_interface.html)
* [python venv module](https://docs.python.org/3/library/venv.html)
* [conda env](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
* [Getting started with Conda](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html)

