---
sort: 1
title: Quick Start
---
## Apply for an account 🙋‍♂️🙋‍♀️
Follow the instructions [here](/Basic/Account) to apply for an account. Make sure you read the instructions and user policies before applying. Wait for a day or so, then you will receive the e-mail 🥳.

## Log in to Gravity Cluster 💻

You are supposed to use **_ssh key_** to log in to Gravity, because we **DO NOT** allow password login.

```bash
ssh -i ~/.ssh/id_rsa_For_Gravity username@gravity.sjtu.edu.cn
```

## Job (PBS) 🔭

- submit an **interactive** job

```bash
qsub -I -l nodes=1:ppn=72,walltime=48:00:00 -q normal
```

- submit a **batch** job

create _a file_ `myjob.pbs` like this:

```bash
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

```bash
qsub myjob.pbs
```

- **check**/**delete** job

```bash
qstat -a
qdel 36162  # 36162 is your jobID
```

## Cheatsheet 📜

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
| `rsync -avP -e "ssh -i ~/.ssh/id_rsa_For_Gravity" local_file username@gravity.sjtu.edu.cn:remote_file` | copy local files/folder to Gravity (**check time&size**, faster) |
| `rsync -avP -e "ssh -i ~/.ssh/id_rsa_For_Gravity" username@gravity.sjtu.edu.cn:remote_file local_file` | copy Gravity files/folder to local (**check time&size**, faster) |
| `rsync -acvP -e "ssh -i ~/.ssh/id_rsa_For_Gravity" local_file username@gravity.sjtu.edu.cn:remote_file` | copy local files/folder to Gravity (**check MD5**, slower) |
| `rsync -acvP -e "ssh -i ~/.ssh/id_rsa_For_Gravity" username@gravity.sjtu.edu.cn:remote_file local_file` | copy Gravity files/folder to local (**check MD5**, slower) |
| `wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh` | download file                                                |
| `curl -O https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh` | download file                                                |
| `axel -n 8 https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh` | ⚡ download file using **multi-threads** (8 threads)          |
| `qsub -I -l nodes=1:ppn=72,walltime=48:00:00 -q normal`      | submit an **interactive** job to _normal queue_              |
| `qsub -I -l nodes=gr06:ppn=72,walltime=48:00:00 -q normal`   | submit an **interactive** job to _normal queue_, specifically, use **gr06** node |
| `qsub -I -X -v DISPLAY -l nodes=1:ppn=72,walltime=12:00:00 -q normal` | submit an **interactive** job to _normal queue_, use **X11** to show **GUI** |
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
| `qselect -u $USER | xargs qdel`                              | delete all of your jobs                                      |
| `qselect -u $USER -s Q | xargs qdel`                         | delete all of your **Queueing** jobs                         |
| `qselect -u $USER -s R | xargs qdel`                         | delete all of your **Running** jobs                          |
| `qhold <job_id>`                                             | **hold** a job until you release it                          |
| `qrls <job_id>`                                              | **release** a job                                            |
| `pestat`                                                     | every node status                                            |
| `showq`                                                      | overview of nodes                                            |
| `sbatch job.slurm`                                           | submit a batch job (*slurm*)                                 |
| `squeue`                                                     | check job state (*slurm*)                                    |
| `scancel <Job ID>`                                           | cancel job (*slurm*)                                         |
| `sattach <Job ID>`                                           | **connect** to standard input/output/error streams of job (*slurm*) |
| `sinfo`                                                      | overview of nodes (*slurm*)                                  |
| `module av`                                                  | modules **available**                                        |
| `module list`                                                | modules loaded                                               |
| `module load anaconda/anaconda/conda-4.12.0`                        | **load** module                                              |
| `module unload anaconda/anaconda/conda-4.12.0`                      | **unload** module                                            |
| `module purge`                                               | **unload all** modules                                       |
| `conda env list`                                             | see conda environment                                        |
| `conda activate <env_name>`                                  | activate environment                                         |
| `conda deactivate`                                           | deactivate environment                                       |
| `conda create -n myenv python=3.9 matplotlib scipy astropy`  | create a virtual environment                                 |
| `conda create -n new_env --clone old_env`                    | clone `new_env` from `old_env`                               |
| `conda search emcee`                                         | search package                                               |
| `conda install -c conda-forge emcee`                         | install package                                              |
| `mamba create -n myenv python=3.9 matplotlib scipy astropy`  | ⚡ create a virtual environment                               |
| `mamba create -n new_env --clone old_env`                    | ⚡ clone `new_env` from `old_env`                             |
| `mamba search emcee`                                         | ⚡ search package                                             |
| `mamba install -c conda-forge emcee`                         | ⚡ install package                                            |
| `python -m ipykernel install --user --name <name_you_like>`  | **install ipykernel** so that you can use it in **Jupyter** notebook/lab |
| `python -u test.py`                                          | run python script **without buffering** (no stdout and stderr buffer)    |
| `icfsquota <username>`                                       | disk usage and quota **(Gravity)**                           |
| `quota -ls`                                                  | disk usage and quota **(SGI)**                               |
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
| `pkill -u <username>`                                        | **kill all** processes belonging to *username*               |
| `tail -f My_PBS_Job.log`                                     | see the file output **in time**                              |
| `git clone https://github.com/numpy/numpy.git`               | clone a repository                                           |
| `git pull`                                                   | pull                                                         |
| `pgit clone https://github.com/numpy/numpy.git`              | ⚡ clone a repository                                         |
| `pgit pull`                                                  | ⚡ pull                                                       |
| `eog`                                                        | view **images**                                              |
| `display`                                                    | view **images**                                              |
| `curl -4 ip.p3terx.com`                                      | check my **IP**                                              |
| `curl myip.ipip.net`                                         | check my **IP**                                              |

