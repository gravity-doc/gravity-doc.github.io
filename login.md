---
sort: 3
---

# Log in

Use the domain name **gravity.sjtu.edu.cn** or IP address **111.186.40.49** to log in.


```bash
ssh YOUR_ACCOUNT@gravity.sjtu.edu.cn
```
The default log in node is **login02**.
One can also use login01 via the IP address **111.186.40.52**.

--------

本文将向大家介绍如何通过 SSH 远程登录到 HPC 集群上。在阅读本文档之前，您需要具备 Linux/Unix、终端、MS-DOS、SSH 远程登录的相关知识，或者您可以阅读参考资料理解这些概念。

本文主要内容：

 * 使用ssh登录集群的注意事项；
 * 首次登录准备，如信息采集、客户端下载、ssh登录、ssh文件传输、无密码登录等；
 * 故障排除和反馈。
 
按照文档的操作说明将有助于您完成工作，谢谢您的配合！

```note 
   * HPC账号仅限于同一课题组的成员使用，请勿将账号借给他人使用。
   * 请妥善保管好您的账号密码，不要告知他人。HPC管理员不会要求您提供密码。
   * 恶意的SSH客户端软件会窃取您的密码，请在官网下载正版授权SSH客户端软件。
   * 登录HPC集群后，请不要跳转到其他登录节点。任务完成后请关闭SSH会话。
   * 若无法登录，请检查输入密码或确认IP地址是否正确。您可以参考故障排除和反馈，将诊断信息发送给集群管理员[hpc](https://gravity-doc.github.io/contact.html)邮箱。
```

## 准备

通过 SSH 登录 HPC 集群，需要在客户端输入登录节点 IP 地址（或主机名），SSH 端口，SSH 用户名和密码。账号开通后您会收到以下内容的邮件：

```
ssh YOUR_USERNAME@gravity.sjtu.edu.cn or 111.186.40.49
```

登录节点 IP 地址（或主机名）为 gravity.sjtu.edu.cn

SSH 端口为 22

## Windows用户登录集群
启动客户端 Xshell,填写登录节点地址：gravity.sjtu.edu.cn，端口号采用默认值22，然后点击连接，如下图所示：

![image](imgs/login01.png)
 
在终端窗口中，输入您的SSH用户名和密码进行登录，如图2,图3所示：

![image](imgs/login02.png)

![image](imgs/login02.png)

其它常用windows下的ssh客户端：putty, bitvise ssh client

## Linux/Unix/Mac 用户
Linux / Unix / Mac 用户可以使用终端中的命令行工具登录。下列语句指出了该节点的IP地址、用户名和SSH端口。

```bash
$ ssh YOUR_USERNAME@TARGET_IP
```

## Web-based login
visit [https://[ip_of_login01]:4200](https://111.186.40.52:4200) in your browser.

```tip
Replace `[ip_of_login01]` with the actual ip.
```

# File transfer to/from server
## Windows 用户使用ssh传输文件

安装 Filezilla 软件后，可以双击打开该软件，按照下图进行设置，完成后单击快速链接或者回车可以登录ftp 站点。
输入数据集群IP 用户名 密码和端口号，如下图所示：

![image](imgs/upload01.png)

## Linux/Unix/Mac用户使用ssh传输文件

Linux/Unix/Mac 用户可以使用命令行工具在集群和您自己的计算机之间传输数据。下列语句会将文件夹data/上传到主文件夹的tmp/。

```bash
$ scp -r data/ YOUR_USERNAME@TARGET_IP:tmp/
```

下列语句会将主文件夹的data.out下载到本地当前工作目录中。

```bash
$ scp YOUR_USERNAME@TARGET_IP:data.out ./
```



