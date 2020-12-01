---
sort: 2
---

# Jupyter

You can start your own jupyter-notebook on the login node.

# Jupyter hub
Jupyterhub is available at [https://gravity.sjtu.edu.cn](https://gravity.sjtu.edu.cn)

Note the "s" in "https".

```note
Some browsers show warning about the invalid certificate.  You may manually chose "allow", "trust" or "visit the website" in the settings/permissions/privacy options.

For Safari, click "show details" in the warning page and click "visit the website"
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



