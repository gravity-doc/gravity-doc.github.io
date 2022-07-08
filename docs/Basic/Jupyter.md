---
sort: 6
title: Jupyter
---
# Jupyter
```danger
traditional `username`+`password` method of login will be **Deprecated** in the near future!   

[Please use **2FA** instead](https://gravity-doc.github.io/Basic/Login.html#web-login). 
```

```tip
[**JupyterHub**](https://jupyterhub.readthedocs.io/) is an entry to access jupyter-notebook/lab or other service ✨ 
- Jupyter-notebook/lab is the **easiest way** to coding 🥳
- VScode is the **best editor** in the Universe 💪
- You can use jupyter-notebook/lab or VScode on **both login and computing nodes** 😎     

You can access *Jupyter* on our website:   
- https://gravity.sjtu.edu.cn
- https://jupyter.gravity.sjtu.edu.cn

- PS. We have enabled **Two-Factor Authentication (2FA)**🎉🎉🎉 More details are [Gravity Authentication](https://gravity-doc.github.io/Basic/Login.html#web-login)
```

```warning
**DO NOT** run heavy program on login nodes ❌🙅❌   

If you fail to log in, **DO NOT** try many times, your IP will be **banned** for a period of time 😭
```


## Login   
Visit website:
- https://gravity.sjtu.edu.cn
- https://jupyter.gravity.sjtu.edu.cn

click *Jupyter* button

![login](../images/Basic/index.png)

input *username* + *password* + *TOTP*   
[more details about authentication](https://gravity-doc.github.io/Basic/Login.html#web-login)

![login](../images/Basic/auth_login_2fa.png)

## Usage
### start a server   
click *Start My Server* or *Named Servers* 

```warning
If you use *Named Servers*, its name **CAN NOT** contain any space😢!
```

choose one *Job queue*
> - [LOGIN] 👉 *login nodes* (forever)
> - [SMALL], [FAT], [GPU] 👉 *computing nodes* (time limited)

![select](../images/Basic/jupyterhub-start-server.gif)

configure resource you want

![input](../images/Basic/jupyter_select.png)

### Start kernel
we provide some kernels, installed many useful packages 🎉
- Python2.7
- Python3.7
- Julia
- R

![kernels](../images/Basic/jupyterhub-kernel.png)

You have no permission to install new package in system kernels.
So, if there is **no package** you want or you want to **create your own kernel**, do as following:

### Create kernel
load conda module

```bash
module load anaconda/conda-4.12.0
```

activate base environment (or other environment you like)

```bash
source activate
```

create a new environment

```bash
conda create -n myenv  # or ⚡ mamba create -n myenv
```

install packages you like

```bash
conda install -c conda-forge camb ipykernel # or ⚡ mamba install -c conda-forge camb ipykernel
```

install ipykernel (so that we can use this environment in *Jupyter*)

```bash
python -m ipykernel install --user --name myenv 
```

Now, refresh your *Jupyter*, and you should be able to see your newly configured kernel. Select it for your notebook. enjoy 🎉

### Shutdown Jupyter

- If you want to close it **temporarily**, hoping it is still running on *Gravity*, just **close your browser**.

- If you want to shutdown it **permanently**, click **File -> Hub Control Panel -> Stop My server**

![image-20210730120718970](../images/Basic/jupyterhub-close1.png)

![image-20210730120814518](../images/Basic/jupyterhub-close2.png)

## Tips

### Classic Notebook (too old)
If you prefer the **traditional jupyter-notebook**, it is faster than *JupyterLab*.

![classic notebook](../images/Basic/jupyterhub-classic-notebook.png)

### Retrolab
*retrolab* is **Retro Style** of *JupyterLab*, it is faster than *Jupyterlab* 

![Retrolab](../images/Basic/jupyterhub-retrolab1.png)

It maintains most of properties of *Jupyterlab*. more like a modern *Jupyter-notebook*.

![Retrolab](../images/Basic/jupyterhub-retrolab2.png)

### Drag

You can drag the sub-window to reorganize your workspace like this

![image-20210730121419726](../images/Basic/jupyterhub-drag.png)

Even more, you can drag the unit block of the notebook to another notebook or a console.   

You can open python console combined with the notebook/text file (it's helpful when you wanna temporarily test or debug)   
> - In notebook, you can drag the unit block between notebook and console
> - In text file, you can use **Shift + Enter** to run the code in the console. Also , you can drag code from console.


![image-20210730121846980](../images/Basic/jupyterhub-console.png)

![image-20210730133917039](../images/Basic/jupyterhub-console-text.png)

### Data Transfer

If your need to download/upload files from/to *Gravity*, there is an easiest way that you just need to **drag** whatever you need into/out the Jupyterlab.

> PS. If your files are pretty large (eg. >10GB), you'd better use `scp, rsync` or other tools.

### Markdown

At *Launcher*, you can double click *Markdown file*, then right click to select **Show Markdown Preview** like this

![image-20210730141653276](../images/Basic/jupyterhub-markdown.png)

### Python Documentation

If you are not familiar with some function or package, you can try to use **Show Contextual Help** in *Launcher*. You just need to click the function, and the **Help** (**documentation**) will display instantly!

![image-20210730142333335](../images/Basic/jupyterhub-help.png)

### Diagram

You can click the **Diagram** at *launcher* to draw a flowchart

![open a diagram](../images/Basic/jupyter-diagram-open.png)

There are many templates

![image-20210730143446883](../images/Basic/jupyterhub-flowchart.png)

### Git

From the sidebar, you can find a [Git extension](https://github.com/jupyterlab/jupyterlab-git).

- You can use it clone, pull, push, etc.
- You can use *diff* in the notebook to check what changes you've made.
- You can use it on *Login nodes* and *Computing nodes*

![git GIF](https://raw.githubusercontent.com/jupyterlab/jupyterlab-git/master/docs/figs/preview.gif)

For example🌰, I wanna clone the `pyccl` repo

```link
https://github.com/LSSTDESC/CCL
```

Click the *Git* button → *Clone a Repository*

![git](../images/Basic/git-clone.png)

Input the link `https://github.com/LSSTDESC/CCL.git`

![git](../images/Basic/git-input.png)

Success!!!

![git open](../images/Basic/git-open.png)

### Resource Monitor
From sidebar, you can find a **GPU dashboard** button

![monitor button](../images/Basic/jupyter-resource.png)

You can monitor the **real-time**  resource usage

![monitor view](../images/Basic/monitor-resource.png)

### HDF5 Viewer
You can open and explore **HDF5 files** in JupyterLab.

Here is a `hdf5` file, you can click on it

![hdf5 file](../images/Basic/hdf5-file.png)

Then you will see this panel, showing the data

![hdf5 open](../images/Basic/hdf5-select.png)

You can explore the data, and even **filter** it!

![hdf5 filter](../images/Basic/hdf5-view.png)

### Variable Inspector
You can **right-click** your notebook, select `Open Variable Inspector`

![variable open](../images/Basic/variable-click.png)

It will open a sub-window showing current variables

![variable view](../images/Basic/variable-view.png)

### TAB Selection
when coding, you can use `<TAB>` to view the sub-function, and
- `<Shift>+<TAB>` upside
- `<TAB>` downside

![tab](../images/Basic/tab.png)

### Chinese
You can also change the language to Chinese(中文)

![chinese](../images/Basic/chinese.png)

# VScode

As is well-known, *VScode* is the best editor for coding in the world 😜

> 1. 💪 thousands of extensions available
> 2. ⚡ much **faster** than Jupyter
> 3. 💯 support C/C++, Fortran, R, Go, Julia, Python etc.
> 4. 😎 install any extension you like, **customize** your own vscode!

Here, wo provide two options:

> - *VScode [sys]*: You cannot install any plugin on it, however, in my opinion, it is enough to use. We have already installed many plugins and configured it well!
>
> - *VScode [my]*: This is **totally clean**. You can install/uninstall any plugin or change any configuration in it!

```tip
1. **Only if** you stop the server from JupyterHub, can the VScode really stop.
2. It's better to use **Chrome** or **Edge** rather than ~~Firefox~~.
```

Start *VScode* from *Jupyterlab*, double click 

![image-20210730145322829](../images/Basic/jupyterhub-vscode-click.png)

Coding, no matter you perfer C/C++ or Julia or other language, it's easy to use

![image-20210730145603882](../images/Basic/jupyterhub-vscode-coding.png)

Also, it supports *jupyter-notebook*

![image-20210730145653821](../images/Basic/jupyterhub-vscode-notebook.png)
