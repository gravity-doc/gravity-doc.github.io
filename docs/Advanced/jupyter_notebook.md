---
sort: 3
title: Jupyter Lab/Notebook
---

```tip
We recommend you to use [*JupyterHub*](/Basic/Coding.html), it's more easier and convenient 😜   
You can also **use your own environment** in [*JupyterHub*](/Basic/Coding?id=create-new-environmentkernel)   
Here, we introduce how to connect *jupyter-notebook/lab* on *Gravity* (login or computing nodes) 👇
```

1. Prepare your own `jupyter-notebook` (`jupter-lab`) or just use system's module   
   前期准备：拥有自己的conda环境，并且环境中安装配置了jupyter netobook；或者直接使用系统自带的

2. Create a **PBS script** `jupyter.sh`, for example 🌰:   
   创建一个**PBS脚本** `jupyter.sh`，举个栗子 🌰：   

```bash
#!/bin/bash
# job name
#PBS -N MyJupyter
# email notification
#PBS -m abe 
#PBS -M lalala@sjtu.edu.cn
# 1 node and 16 cores per node
#PBS -l nodes=1:ppn=16
# 24 hours
#PBS -l walltime=24:00:00
# queue name (normal, small, fat, gpu)
#PBS -q small
# log file
#PBS -j oe
#PBS -o $PBS_JOBNAME.log

echo "******************** START **********************"
echo "starting at `date`"

echo "loading anaconda ... activate python3 environment ..."
module load anaconda/conda-4.12.0 && source activate /opt/conda/conda-4.12.0/envs/python3

echo "starting jupyter-lab ..."
jupyter-lab --no-browser --ip=0.0.0.0 --port=9999

echo "end at `date`"
echo "********************* END ***********************"
```

3. submit your job   
提交任务   

```bash
qsub jupyter.sh
```

4. connect to `jupter-lab/notebook`   
连接至`jupter-lab/notebook`    

   1. Let's see which node the job is running at? (assume *gr33*)    
      我们来看看任务在哪个节点上运行？（假设是*gr33*）     

      ```bash
      qstat -an -u `whoami`

      # output👇
      login: 
                                                                                        Req'd       Req'd       Elap
      Job ID                  Username    Queue    Jobname          SessID  NDS   TSK   Memory      Time    S   Time
      ----------------------- ----------- -------- ---------------- ------ ----- ------ --------- --------- - ---------
      666666.login            lalala      small    MyJupyter        666666     1     16       --   24:00:00 R  00:00:06
         gr33/1-16
      ```
      
   2. Connect to your jupyter-notebook/lab from your PC 💻   
      从你的电脑/手机/平板连接 jupyter-notebook/lab 💻   
      
      ```bash
      ssh -i <your_ssh_private_key> -CNL localhost:23333:gr33:9999 <username>@gravity.sjtu.edu.cn

      # output👇
      nothing here if succeed
      如果成功，这里什么都没有
      ```
      
   3. open browser, start coding 🥳   
      [打开浏览器](http://localhost:23333)，开始敲代码 🥳    
      
      ```http
      http://localhost:23333
      ```