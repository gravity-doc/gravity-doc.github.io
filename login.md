---
sort: 3
---

### Log in

Use the domain name **gravity.sjtu.edu.cn** or IP address **111.186.40.49** to log in.


```bash
ssh YOUR_ACCOUNT@gravity.sjtu.edu.cn
```
The default log in node is **login02**.
One can also use login01 via the IP address **111.186.40.52**.

## 通过SSH登录hpc集群

--------

本文将向大家介绍如何通过 SSH 远程登录到 HPC 集群上。在阅读本文档之前，您需要具备 Linux/Unix、终端、MS-DOS、SSH 远程登录的相关知识，或者您可以阅读参考资料理解这些概念。

本文主要内容：

 * 使用ssh登录集群的注意事项；
 * 首次登录准备，如信息采集、客户端下载、ssh登录、ssh文件传输、无密码登录等；
 * 故障排除和反馈。
 
按照文档的操作说明将有助于您完成工作，谢谢您的配合！

# 注意事项

   * HPC账号仅限于同一课题组的成员使用，请勿将账号借给他人使用。
   * 请妥善保管好您的账号密码，不要告知他人。HPC管理员不会要求您提供密码。
   * 恶意的SSH客户端软件会窃取您的密码，请在官网下载正版授权SSH客户端软件。
   * 登录HPC集群后，请不要跳转到其他登录节点。任务完成后请关闭SSH会话。
   * 若无法登录，请检查输入密码或确认IP地址是否正确。您可以参考故障排除和反馈，将诊断信息发送给集群管理员[hpc](https://gravity-doc.github.io/contact.html)邮箱。
   
# 准备

通过 SSH 登录 HPC 集群，需要在客户端输入登录节点 IP 地址（或主机名），SSH 端口，SSH 用户名和密码。账号开通后您会收到以下内容的邮件：

```
ssh YOUR_USERNAME@gravity.sjtu.edu.cn or 111.186.40.49
```

登录节点 IP 地址（或主机名）为 gravity.sjtu.edu.cn

SSH 端口为 22

# 通过SSH登录集群
## Windows用户
启动客户端 Xshell,填写登录节点地址：gravity.sjtu.edu.cn，端口号采用默认值22，然后点击连接，如下图所示：






