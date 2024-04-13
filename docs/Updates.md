
## Future ✨

- [ ] support container (*Singularity* + *Kubernetes*)
  - [ ] migrate the entire Jupyter to Kubernetes
- [ ] switch to Slurm (*PBS* will be **Deprecated**)
  - [ ] enable resource limit on computing nodes (use `cgroup`)
- [ ] update *NIS* to *LDAP* authentication (*NIS* will be **Deprecated**)
  - [ ] Automatically handle new user registration and verification
- [ ] enable **load-balancing** for Gravity website
- [ ] add **real-time monitoring** and **alarm** for sensitive files modification

## Done 🥳

### 2023.11

- [x] self-hosted [*Gitlab*](https://git.gravity.sjtu.edu.cn/) ([how to use](/Advanced/Gitlab))
- [x] self-hosted [*Gravity Documentation*](https://gravity.sjtu.edu.cn/doc/)

### 2022.11

- [x] **SGI** can access Gravity **Home** Directory at `/gravity/home`
- [x] **SGI** can access the Internet directly now 🏄‍
- [x] **SGI** has a disk quota for each user, which is [**10G+1TB**](/Basic/Resource_Monitor?id=disk-quota)

### 2022.7

- [x] [**Gravity Homepage**](https://jupyter.gravity.sjtu.edu.cn/) is ready! 🎉🎉🎉
- [x] add [**FileServer**](/Basic/Data_Transfer?id=fileserver), support download/**share** files 🎉🎉🎉 ([File Sharing DEMO](https://gravity.sjtu.edu.cn/demo/))
- [x] add [**Two-Factor Authentication (2FA)**](/Basic/Login?id=web-login)🔒 for our website
- [x] add [**NEW Spawner for Jupyter**](Coding?id=start-a-server), now you can select and **input options**
- [x] support **change password** / **reset password**(if you forgot your password) on [Gravity Authentication](/Basic/Account?id=change-password)
- [x] NEW in *Jupyter*: [resource monitor](https://gravity-doc.github.io/Basic/Jupyter.html#resource-monitor), [Diagram](https://gravity-doc.github.io/Basic/Jupyter.html#diagram), [Variable Inspector](https://gravity-doc.github.io/Basic/Jupyter.html#variable-inspector), [**HDF5 viewer**](https://gravity-doc.github.io/Basic/Jupyter.html#hdf5-viewer), [**`<TAB>` selection**](https://gravity-doc.github.io/Basic/Jupyter.html#tab-selection), [Retrolab](https://gravity-doc.github.io/Basic/Jupyter.html#retrolab), *dracula* theme, [中文语言包](https://gravity-doc.github.io/Basic/Jupyter.html#chinese). Remove some unused kernels
- [x] add **HTTP proxy server**, now you can [**🏄‍surf the Internet**](https://gravity-doc.github.io/Software/Proxy.html#surf-the-internet) such as `git/curl/wget` when using *Jupyter/VScode* on *computing nodes*. Meanwhile, it will automatically *speedup*⚡ `git clone/pull/push` from/to **Github** **[ NO WARRANTY ]**
- [x] add **HTTP cache** to accelerate *Jupyter/VScode*
- [x] add [**Monitor**](https://jupyter.gravity.sjtu.edu.cn/status/?theme=dark) to check Gravity status
- [x] add [**SpeedTest**](https://jupyter.gravity.sjtu.edu.cn/speedtest/) to test connection speed between you and Gravity

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
- [x] [speedup git ⚡](https://gravity-doc.github.io/Software/Proxy.html#speedup-git) (including `git clone, git pull, etc.`)    

- [x] add and improve command to query CPU time (expense) and Disk usage   
  > `icfsquota`   
  > `cpuquota`    

- [x] [enable the **E-mail notification** of PBS ](https://gravity-doc.github.io/Basic/Job.html#complete-example)      
  
  > In your **PBS script**, you can add `#PBS -m abe` and `#PBS -M <username>@gravity.sjtu.edu.cn` 

- [x] shorten the waiting time when log in Gravity
