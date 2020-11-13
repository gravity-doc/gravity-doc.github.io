---
sort: 2
---

# Jupyter

You can start your own jupyter-notebook on the login node.

# Jupyter hub
Jupyterhub is available on login01. 

Visit [https://gravity.sjtu.edu.cn](https://gravity.sjtu.edu.cn)

Note the "s" in "https".

```note
Some browser shows warning about the certificates.  You may need to set "alloww" or "trust" mannually in your browser settings.
```

# Add your own virtual env into Jupyter Notebook

To do so, you need *ipykernel* package installed in your virtual environment.

Assume that you have created your own virtual environment named *MYENV* and activated.

Install *ipykernel*, `pip install ipykernel` .

Then configure it 
`python -m ipykernel install --user --name MYENV --display-name "abc"`

The virtual environment *MYENV* is shown as *abc* in your jupyternotebook.

[//]:![image](../imgs/jupytervirtualenv.png)

<img src="../imgs/jupytervirtualenv.png" width="300">



