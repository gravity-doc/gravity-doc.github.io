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

- [x] limit each user resource usage on *login nodes* (**20 cores + 50 GB**)

- [x] run `jupyter-lab/notebook` from both *login* and *computing nodes* via **[JupyterHub](https://gravity.sjtu.edu.cn/)**

- [x] [add entry of `VScode` to jupyterlab](https://gravity-doc.github.io/Basic/JupyterHub.html#vscode) 

- [x] install multiple extensions on Jupyterlab (eg. git, drawio, execute-time, resource-monitor, jupyterlab-lsp)

- [x] [enable the **E-mail notification** of PBS](https://gravity-doc.github.io/Basic/Job.html#complete-example)

  > In your **PBS script**, you can add `#PBS -m abe` and `#PBS -M <username>@gravity.sjtu.edu.cn` 

- [x] [enable priority of PBS queue](https://gravity-doc.github.io/Basic/Job.html#ordinary-queues)
- [x] automatic **ban IP** with too many login attempts (both ssh and JupyterHub)
- [x] [speedup git](https://gravity-doc.github.io/Software/Speedup_Git.html) (including `git clone, git pull, etc.`)
- [x] [support data sharing service](https://jupyter.gravity.sjtu.edu.cn/share/) (need to contact admins)
