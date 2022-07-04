---
sort: 4
title: Updates
---

## Future ✨

- [ ] support container
- [ ] switch to Slurm (PBS will be **deprecated**)

## Done 🥳

### 2022.7
- [x] [**Gravity Homepage**](https://jupyter.gravity.sjtu.edu.cn/) is ready! 🎉🎉🎉
- [x] enable [**Two-Factor Authentication (2FA)**](https://gravity-doc.github.io/Basic/Login.html#web-login) for [**Jupyter**](https://jupyter.gravity.sjtu.edu.cn)
- [x] support **change password** / **reset password**(if you forgot your password) on [Gravity Authentication](https://gravity-doc.github.io/Basic/Login.html#web-login)
- [x] update `Jupyterhub/Jupyterlab/VScode`
- [x] new Jupyterlab extension: [GPU resource monitor](https://gravity-doc.github.io/Basic/Jupyter.html#gpu-monitor), [Diagram](https://gravity-doc.github.io/Basic/Jupyter.html#flowchart), variable inspector, github, dracula theme, 中文语言包
- [x] use *HTTP cache* to accelerate *Jupyter*
- [x] add [**NEW Spawner** for Jupyter](https://gravity-doc.github.io/Basic/Jupyter.html#start-a-server), now you can select and input options when spawn server
- [x] add [FileServer](https://gravity-doc.github.io/Basic/Data_Transfer.html#FileServer), support upload/download/**share** files 🎉🎉🎉
- [x] add **HTTP proxy server**, now support to **🏄‍surf the Internet** when spawn *Jupyter* server on *computing nodes*, such as `git/curl/wget`, automatically *⚡speedup* `git clone/pull/push` from/to **Github** **[ NO WARRANTY ]**

### 2021.9

- [x] install [`Julia, Go, R, Rust, C, C++, Fortran` **kernels**](https://gravity-doc.github.io/Basic/JupyterHub.html#choose-a-kernel-environment) into *Jupyterlab* and install many useful packages in `R, Julia`
- [x] make [*VScode*](https://gravity-doc.github.io/Basic/JupyterHub.html#vscode) available on computing nodes

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
