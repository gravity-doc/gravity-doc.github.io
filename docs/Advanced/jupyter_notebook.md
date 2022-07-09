---
sort: 3
title: Jupyter Lab/Notebook
---

```tip
We recommend you to use [*JupyterHub*](https://gravity-doc.github.io/Basic/Jupyter.html), it's more easier and convenient 😜   
You can also **use your own environment** in [*JupyterHub*](https://gravity-doc.github.io/Basic/Jupyter.html)   
Here, we introduce how to connect *jupyter-notebook/lab* on *Gravity* (login or computing nodes) 👇
```

1. Prepare your own `jupyter-notebook` (`jupter-lab`) or you can just use system's directly.   
   前期准备：拥有自己的conda环境，并且环境中安装配置了jupyter netobook；或者直接使用系统自带的

2. Create a **PBS script** `jupyternotebook.pbs`, for example 🌰:   
   创建一个**PBS脚本** `jupyternotebook.pbs`，举个栗子 🌰：   

   ```bash
   #PBS -N notebook
   #PBS -l nodes=1:ppn=1
   #PBS -l walltime=72:00:00 
   #PBS -q normal
   
   # load anaconda of system using module
   # you can also use your own
   module load anaconda/anaconda-mamba
   source activate mamba-python3
   
   # start the jupyter lab/notebook!
   # nohup jupyter-notebook > jupyternotebook.log 2>&1 &
   nohup jupyter-lab --no-browser --ip=0.0.0.0 --port=9999 > jupyterlab.log 2>&1 &
   
   # because we let jupyter run background, 
   # here we need to prevent the PBS to kill your job
   sleep 72h
   ```

3. submit your job   
   提交任务   

   ```bash
   qsub jupyternotebook.pbs
   ```

4. connect to `jupter-lab/notebook`   
   连接至`jupter-lab/notebook`    

   1. Let's see which node the job is running at? (assume *gr33*)    
      我们来看看任务在哪个节点上运行？（假设是*gr33*）     

      ```bash
      qstat -an
      ```
      
   2. Connect to your jupyter-notebook/lab from your PC 💻   
      从你的电脑/手机/平板连接 jupyter-notebook/lab 💻   
      
      ```bash
      ssh -i <your_ssh_key> -CNL localhost:23333:gr33:9999 <username>@gravity.sjtu.edu.cn
      ```
      
   3. open browser, start coding 🥳   
      打开浏览器，开始敲代码 🥳    
      
      ```http
      http://localhost:23333
      ```



