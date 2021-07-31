---
sort: 3
title: Jupyter Notebook
---

```tip
### We recommend you to use *[JupyterHub](https://gravity-doc.github.io/Basic/JupyterHub.html), it's more easier and convenient 😜
You can also use your own environment in *JupyterHub*
```



前期准备：拥有自己的conda环境，并且环境中安装配置了jupyter netobook。

创建文件`touch jupyternotebook.pbs`,并编辑文件

例如：
```bash
#PBS -N notebook
#PBS -l nodes=1:ppn=1
#PBS -l walltime=72:00:00 
#PBS -q normal
#PBS -S /bin/bash

# load anaconda of system using module
# you can also use your own if you want
module load anaconda/anaconda-mamba
source activate mamba-python3

# start the jupyter lab/notebook!
# nohup jupyter-notebook > jupyternotebook.log 2>&1 &
nohup jupyter-lab > jupyterlab.log 2>&1 &

# because we let jupyter run background, 
# here we need to stop job stop
sleep 72h
```
把`mamba-python3`换成自己的conda环境，`sleep 72h`即过72小时后任务结束，可以自己调节。使用`qsub jupyternotebook.pbs`提交任务

然后查看生成的`jupyterlab.log`文件，可以使用`cat jupyterlab.log | grep http`命令看到 *jupyter lab/notebook*运行的计算节点和端口
```bash
[inspur03@login02 ~]$ cat jupyternotebook.file | grep http
[I 10:42:14.172 NotebookApp] http://gr32:18890/
```
然后在本地打开一个新的远程界面，输入`ssh -L 2567:gr32:18890 user@gravity.sjtu.edu.cn -fN`,(`2567`是本地端口可以自定义。`gr32:18890`是jupyter notebook自动生成的计算节点和端口，`user`是用户名，`gravity.sjtu.edu.cn`登录节点网址)

打开本地浏览器输入`http://localhost:2567`就可以打开jupyter notebook了（`注意：使用http，不要使用https`）
