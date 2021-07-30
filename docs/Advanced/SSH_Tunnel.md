---
sort: 2
---

# SSH Tunnel

```note
Considering security, *Gravity* closes ports except **22, 80, 443**. Therefore, you need *ssh tunnel* to connect other service.
```
```tip
Basically, *ssh* has 3 kinds of tunnel
1. local
2. remote
3. dynamic

We only use **local**, it's enough and frequently used.
```

## VNC
VNC is a fast tool to connect to a graphical desktop on the server.

### Getting started

You need to create a vncserver on gravity before you can connect with vnc. 

首先在服务器上使用命令vncsrver开启vnc。

```
[inspur@login02 ~]$ vncserver

New 'login02:37 (inspur)' desktop is login02:37

Starting applications specified in /home/inspur/.vnc/xstartup
Log file is /home/inspur/.vnc/login02:37.log
```

Take a note of the port number (37 in this case). You will need to connect to this port number in your vnc client.

请记住这里显示的端口号（图中是37）。

```tip

  You will be prompted to setup a password the first time you do this. This will be the password you use to connect to vnc. This password is separate from the ssh password.

  第一次开启vnc时在输入命令后会先让你设置密码，之后再使用或者开启新的端口都会使用默认密码.
```

- checking for running servers

If you forget your port number, you can find it using `vncserver -list` on gravity:
使用命令`vncserver -list`可以查看vnc开启的端口:

```
[inspur@login02 ~]$ vncserver -list

TigerVNC server sessions:

X DISPLAY #	PROCESS ID
:34		541452
:37		555581
```
The above output shows you have two servers running on port 34 and 37 respectively.

- terminating the server

You can terminate the server once you no longer need it, to release resources to the login node. For example:

使用命令vncserver -kill，可以终止自己的vncserver进程

```
[inspur@login02 ~]$ vncserver -kill :37
Killing Xvnc process ID 555581
```

The above command will terminate your vncserver running on port 37.

### Connect to the vnc server

You will need to use a vnc client to connect to your server. On Linux, you can use Remmina Remote Desktop Client. 

In Remmina, select "new connection". In protocol, select VNC. In the Basic tab, fill in the server address and vncserver port, your username and vnc password. 

<img src="../imgs/remmina.png" width=400/>

For security reasons, you can only connect to vnc through ssh-tunnel. This can be done in the "SSH Tunnel" tab. Select "Enable SSH tunnel", input your username, and select Public key authentication.

<img src="../imgs/remmina2.png" width=400/>

你可以使用喜欢的vnc客户端连到前面建立的vncserver。在客户端中输入服务器地址和vncserver端口号。由于安全原因，还需要选择打开ssh-tunnel选项。

### Trouble-shooting
- No desktop
If you do not see a graphical desktop after connecting, you can remove your xstartup file and restart the server.
如果连接上vnc之后没有桌面，请尝试

```
rm ~/.vnc/xstartup
```
之后重新启动vncserver:

```
vncserver -kill :37
vncserver
```

- Authentication failure.

First check if you have ssh-tunnel enabled. Then check if you used the right vnc password (not your ssh password). If you forget your vnc password, you can reset it by removing your passwd file through:

如果登录vnc viewer时显示Authentication failure，请检查是否开启了ssh-tunnel。如果还有问题，表示密码错误，如果忘记密码，请尝试

`rm ~/.vnc/passwd`

Then you can reset your password through `vncpasswd`, and try to connect again.
之后使用vncpasswd重新设置密码，之后再尝试连接。



## jupyter-notebook

前期准备：拥有自己的conda环境，并且环境中安装配置了jupyter netobook。

创建文件`touch jupyternotebook.pbs`,并编辑文件

例如：
```bash
#PBS -N jupyternotebook
#PBS -l nodes=1:ppn=1
#PBS -q normal
#PBS -V
#PBS -S /bin/bash
#PBS -l walltime=71:00:00 
### Set intel environment###

module load anaconda/anaconda3
conda activate inspur03

nohup jupyter notebook >jupyternotebook.file 2>&1 &

sleep 6000
```
把`inspur03`换成自己的conda环境，`sleep 6000`过60分钟后任务结束，可以自己调节。使用`qsub ./jupyternotebook.pbs`提交脚本

然后查看生成的`jupyternotebook.file`文件，可以使用`cat jupyternotebook.file | grep http`命令看到jupyter notebook运行的计算节点和端口
```bash
[inspur03@login02 ~]$ cat jupyternotebook.file | grep http
[I 10:42:14.172 NotebookApp] http://gr32:18890/
```
然后在本地打开一个新的远程界面，输入`ssh -L 2567:gr32:18890 user@gravity.sjtu.edu.cn -fN`,(`2567`是本地端口可以自定义。`gr32:18890`是jupyter notebook自动生成的计算节点和端口，`user`是用户名，`gravity.sjtu.edu.cn`登录节点网址)

打开本地浏览器输入`http://localhost:2567`就可以打开jupyter notebook了（`注意：使用http，不要使用https`）

## status/statistics website
You can check the status of jobs and queues through the [ClusterEngine](https://stat.gravity.sjtu.edu.cn) webpage. For security reasons, currently the webpage is only accessible through a tunnel. First create a tunnel using:

```
ssh -L 8443:localhost:8443 user@login01.gravity.sjtu.edu.cn -fN
```

Replace `user ` with your username on gravity in the above command. Once this is done, open your browser and visit https://localhost:8443 .