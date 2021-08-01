---
sort: 4
title: Updates
---

## Future ✨

- [ ] Two-Factor Authentication (2FA) for [**JupyterHub**](https://gravity.sjtu.edu.cn/)
- [ ] add Julia, Go, C, Fortran kernels to *Jupyterlab*
- [ ] make *VScode* available on computing nodes
- [ ] container support
- [ ] switch to Slurm (PBS will be deprecated)

## Done 🥳

### 2021.8

- [x] reconstruct the [*Gravity Documentation*](https://gravity-doc.github.io/)

### 2021.7

- [x] [add entry of `VScode`](https://gravity-doc.github.io/Basic/JupyterHub.html#vscode) in jupyterlab, and support **C/C++, Fortran, Go, R, Julia, Python** if you choose *VScode [sys]* in Jupyterlab
- [x] run `jupyter-lab/notebook` from both *login* and *computing nodes* via **[JupyterHub](https://gravity.sjtu.edu.cn/)**
- [x] install **several extensions** on Jupyterlab (ie. git, drawio, execute-time, resource-monitor, jupyterlab-lsp)

### 2021.6
- [x] [enable priority of PBS queue](https://gravity-doc.github.io/Basic/Job.html#ordinary-queues)    
- [x] [support **Data Sharing** service](https://jupyter.gravity.sjtu.edu.cn/share/) (need to contact admins to use it)   
- [x] **limit** each user resource usage on *login nodes* (**20 cores + 50 GB**)   
- [x] automatically **ban IP** with too many failed login attempts ( *ssh* + *JupyterHub*)   

### 2021.5
- [x] [speedup git ⚡](https://gravity-doc.github.io/Software/Speedup_Git.html) (including `git clone, git pull, etc.`)    

- [x] add and improve command to query CPU time (expense) and Disk usage   
  > `icfsquota`   
  > `cpuquota`    

- [x] [enable the **E-mail notification** of PBS ](https://gravity-doc.github.io/Basic/Job.html#complete-example)      
  
  > In your **PBS script**, you can add `#PBS -m abe` and `#PBS -M <username>@gravity.sjtu.edu.cn` 

- [x] shorten the waiting time when log in Gravity
