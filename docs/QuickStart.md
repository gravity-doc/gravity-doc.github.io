---
sort: 1
title: Quick Start
---
### Apply for an account 🙋‍♂️🙋‍♀️
[Click here](https://forms.office.com/Pages/ResponsePage.aspx?id=-f5HFYhWBkCG2kSQ-Sc_lW_CRAlVS3tEtz1OEMF6VRNUMUNLOUVOSFhSMTJSTzJSUVozQldJVlRDUy4u) to fill out the form. Wait for a day or so, then you will receive the e-mail 🥳.

### Log in to Gravity Cluster 💻

You are supposed to use **_ssh key_** to log in to Gravity, because we **DO NOT** allow password login.

```sh
ssh -i ~/.ssh/id_rsa_For_Gravity username@gravity.sjtu.edu.cn
```

### Job (PBS) 🔭

- submit an **interactive** job

```sh
qsub -I -l nodes=1:ppn=72,walltime=48:00:00 -q normal
```

- submit a **batch** job

create _a file_ `myjob.pbs` like this:

```sh
#!/bin/bash
#PBS -N My_job
#PBS -m abe
#PBS -M lalala@sjtu.edu.cn
#PBS -l nodes=1:ppn=72
#PBS -l walltime=48:00:00
#PBS -q normal
cd $PBS_O_WORKDIR

# run your own program!!!
python test.py
```
  then, submit it!
```sh
qsub myjob.pbs
```

- **check**/**delete** job

```sh
qstat -a
qdel 36162  # 36162 is your jobID
```

### Cheatsheet 📜

| **Command**                                                  | **Description**                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| `ssh -i ~/.ssh/id_rsa_For_Gravity username@gravity.sjtu.edu.cn` | log in to Gravity using _ssh key_: **~/.ssh/id_rsa_For_Gravity** |
| `ssh -X -i your_ssh_key username@gravity.sjtu.edu.cn `       | login with X11 (use GUI)                                     |
| `ssh -i your_ssh_key -CNL localhost:8888:localhost:9999 username@gravity.sjtu.edu.cn` | **ssh tunnel** from local port 8888 to Gravity port 9999 (use jupyter-notebook, VNC) |
| `ssh -i your_ssh_key -CNL localhost:8888:gr33:9999 username@gravity.sjtu.edu.cn` | **ssh tunnel** from local port 8888 to Gravity **gr33 node** port 9999 (use [jupyter-notebook](http://localhost:8888), VNC) |
| `ssh -i your_ssh_key -CNL localhost:8888:localhost:8443 username@login01` | **ssh tunnel** from local 8888 to remote 8443 (access [**status website**](https://localhost:8888), you have to log in to **login01**) |
| `scp -i your_ssh_key ~/local_file username@gravity.sjtu.edu.cn:/home/username/remote_file` | copy local file to Gravity                                   |
| `scp -r -i your_ssh_key local_folder username@gravity.sjtu.edu.cn:remote_folder` | copy local folder to Gravity                                 |
| `scp -i your_ssh_key username@gravity.sjtu.edu.cn:remote_file local_file ` | copy Gravity file to local                                   |
| `scp -r -i your_ssh_key username@gravity.sjtu.edu.cn:remote_folder local_folder` | copy Gravity folder to local                                 |
| `rsync -avP -e "ssh -i ~/.ssh/id_rsa_For_Gravity" local_file username@gravity.sjtu.edu.cn:remote_file` | copy local files/folder to Gravity                           |
| `rsync -avP -e "ssh -i ~/.ssh/id_rsa_For_Gravity" username@gravity.sjtu.edu.cn:remote_file local_file` | copy Gravity files/folder to local                           |
| `wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh` | download file                                                |
| `curl -O https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh` | download file                                                |
| `axel -n 8 https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh` | ⚡ download file using **multi-threads** (8 threads)          |
| `qsub -I -l nodes=1:ppn=72,walltime=48:00:00 -q normal`      | submit an **interactive** job to _normal queue_              |
| `qsub -I -l nodes=gr06:ppn=72,walltime=48:00:00 -q normal`   | submit an **interactive** job to _normal queue_, specifically, use **gr06** node |
| `qsub myjob.pbs`                                             | submit a batch job                                           |
| `qstat -a`                                                   | jobs status                                                  |
| `qstat -n`                                                   | jobs status (see which node you are using)                   |
| `qstat -f <job_id>`                                          | job status (**in detail**)                                   |
| `qstat -q`                                                   | queues info                                                  |
| `qstat -f -Q`                                                | queues info (in detail)                                      |
| `checkjob <job_id>`                                          | job status (if you are **always waiting** or **something wrong**) |
| `showstart <job_id>`                                         | ***when*** to start (if your job is waiting)                 |
| `qdel <job_id>`                                              | **delete** a job                                             |
| `qdel -p <job_id>`                                           | force to **delete** a job                                    |
| `qhold <job_id>`                                             | **hold** a job until you release it                          |
| `qrls <job_id>`                                              | **release** a job                                            |
| `pestat`                                                     | every node status                                            |
| `showq`                                                      | overview of nodes                                            |
| `module av`                                                  | modules **available**                                        |
| `module list`                                                | modules loaded                                               |
| `module load anaconda/anaconda-mamba`                        | **load** module                                              |
| `module unload anaconda/anaconda-mamba`                      | **unload** module                                            |
| `conda env list`                                             | see conda environment                                        |
| `conda activate <env_name>`                                  | activate environment                                         |
| `conda deactivate`                                           | deactivate environment                                       |
| `conda create -n myenv python=3.7 matplotlib scipy astropy`  | create a virtual environment                                 |
| `conda search emcee`                                         | search package                                               |
| `conda install -c conda-forge emcee`                         | install package                                              |
| `mamba create -n myenv python=3.7 matplotlib scipy astropy`  | ⚡ create a virtual environment                               |
| `mamba search emcee`                                         | ⚡ search package                                             |
| `mamba install -c conda-forge emcee`                         | ⚡ install package                                            |
| `python -m ipykernel install --user --name <name_you_like>`  | **install ipykernel** so that you can use it in Jupyter notebook/lab |
| `python -u test.py`                                          | run python script **without buffering** (no stdout and stderr buffer) |
| `icfsquota <username>`                                       | disk usage and quota                                         |
| `cpuquota`                                                   | CPU hours and **expense**                                    |
| `finger <username>`                                          | user info                                                    |
| `passwd`                                                     | change password                                              |
| `yppasswd`                                                   | change password (**recommended**)                            |
| `top`                                                        | processes info                                               |
| `top -u <username>`                                          | my processes info                                            |
| `htop`                                                       | processes info (beautiful)                                   |
| `htop -u <username>`                                         | my processes info (beautiful)                                |
| `ps aux | grep python`                                       | process info including string: *python*                      |
| `ps -eo pid,tty,user,command,lstart,etime | grep <username>` | **my own** processes info                                    |
| `kill -9 <PID>`                                              | **kill** the process using its PID                           |
| `tail -f My_PBS_Job.log`                                     | see the file output **in time**                              |
| `git clone https://github.com/numpy/numpy.git`               | clone a repository                                           |
| `pgit clone https://github.com/numpy/numpy.git`              | ⚡ clone a repository                                         |
| `git pull`                                                   | pull                                                         |
| `pgit pull`                                                  | ⚡ pull                                                       |
| `eog`                                                        | view images                                                  |
| `display`                                                    | view images                                                  |

