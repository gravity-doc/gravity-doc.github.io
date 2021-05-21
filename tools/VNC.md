---
sort: 5
---

# VNC

## 开启vnc

使用命令vncsrver开启vnc，第一次开启vnc时在输入命令后会先让你设置密码，之后再使用或者开启新的端口都会使用默认密码。

```
[inspur@login02 ~]$ vncserver

New 'login02:37 (inspur)' desktop is login02:37

Starting applications specified in /home/inspur/.vnc/xstartup
Log file is /home/inspur/.vnc/login02:37.log
```

## 查看vnc端口

使用命令vncserver -list可以查看vnc开启的端口。

```
[inspur@login02 ~]$ vncserver -list

TigerVNC server sessions:

X DISPLAY #	PROCESS ID
:34		541452
:37		555581
```

## 杀掉vnc端口

使用命令vncserver -kill，可以杀死自己的vnc进程

```
[inspur@login02 ~]$ vncserver -kill :37
Killing Xvnc process ID 555581
```

## 客户端使用vnc

打开vnc工具，点击File-->New connection... 输入ip和端口 

```
例如：111.186.40.49:34
```

```tip1
如果连接上vnc之后没有桌面，请尝试

`rm ~/.vnc/xstartup`

之后重新启动vncserver 。注意开启新的server前要杀掉之前的（vncserver -kill)。
```
```tip2
如果登录vnc viewer时显示Authentication failure，请尝试

`rm ~/.vnc/passwd`

之后使用vncpasswd重新设置密码，之后再尝试连接。
```

