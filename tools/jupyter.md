---
sort: 2
---

# Jupyter

You can start your own jupyter-notebook on the login node.

# Jupyter hub
Jupyterhub is available on login01. 

To use it, first do a port binding for security:

```bash
ssh -L 8000:localhost:8000 user@gravity.sjtu.edu.cn -fN
```

```note 
replace `user` with your actual username. 
```

Then visit [http://localhost:8000](http://localhost:8000)
