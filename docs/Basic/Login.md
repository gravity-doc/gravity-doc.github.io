---
sort: 2
title: Login
---

# Log in Gravity
```note
For enhanced security, we have enabled **2 Factor Authentication (2FA)** on web login. You need to install an *Authenticator app* to log into the web interface.    

Using `ssh` to log in only requires your **ssh private key** as before.
```

```danger
If you fail to login, please do not try many times. Otherwise your IP will be **banned** for a period of time 😭
```

## SSH login
### 1. generate `ssh-key`

generate a [*ssh-key*](https://wiki.archlinux.org/title/SSH_keys_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)) pair   
open a terminal (Linux/Windows/Mac):

```bash
ssh-keygen
# Enter
# Enter
# Enter
```

It will generate two files:
- `id_rsa` (*private key*)
- `id_rsa.pub` (*public key*)

### 2. add `public key` to Gravity
You will be asked to provide your *public key* (`id_rsa.pub`) when registering. If everything is OK, skip this step.   
If you need to add `pub-key` manually:
- use *Jupyter's* *terminal* to add `id_rsa.pub` to `~/.ssh/authorized_keys`
- send the `pub-key` [via email📧 to us](https://gravity-doc.github.io/#contact), we will help you.

### 3. log in

Gravity has two login nodes: 
- *login01* [ **login01.gravity.sjtu.edu.cn** ] (backup)
- *login02* [ **gravity.sjtu.edu.cn** ] (main)

```bash
ssh -i <your_ssh_public_key> <username>@gravity.sjtu.edu.cn
# for example 🌰
ssh -i /home/lalala/.ssh/id_rsa_For_Gravity lalala@gravity.sjtu.edu.cn
```

```tip
You can set up your `~/.ssh/config` to **simplify** your command😎 as following:
```

Edit your `~/.ssh/config` like this:      

```
Host login01
    HostName login01.gravity.sjtu.edu.cn
    User lalala
    Port 22
    IdentityFile ~/.ssh/id_For_Gravity
Host login02
    HostName gravity.sjtu.edu.cn
    User lalala
    Port 22
    IdentityFile ~/.ssh/id_rsa_For_Gravity
```

Here we go 🥳      

```bash
ssh login01
ssh login02
```

### Software
If you do not like😒 the original terminal, here are some alternative softwares:
- *[MobaXTerm](https://mobaxterm.mobatek.net/download.html)* (**Windows**)
- *[Xshell](https://www.netsarang.com/en/xshell/)*  (**Windows**)
- *[Putty](https://www.ssh.com/ssh/putty/download)*  (**Windows**)
- *[Bitvise](https://www.bitvise.com/ssh-client-download)* (**Windows**)
- *[Termius](https://termius.com/)* (**Mac/Linux/Windows/Android/iOS**)
- *[FinalShell](https://www.hostbuf.com/t/988.html)* (**Mac/Linux/Windows**)
- *[PortX](https://portx.online/zh/)* (**Mac/Linux/Windows**)
- *[WindTerm](https://github.com/kingToolbox/WindTerm)* (**Mac/Linux/Windows**) (🎉**open source**🎉)
- *[Tabby](https://tabby.sh/)* (**Mac/Linux/Windows**) (🎉**open source**🎉)
- *[iTerm](https://iterm2.com/)* (**Mac**)
- *[JuiceSSH](https://apkpure.com/juicessh-ssh-client/com.sonelli.juicessh)* (**Android**)
- *[Termux](https://github.com/termux/termux-app)* (**Android**) (🎉**open source**🎉)
   
## Web login
### 1. install Authenticator app
We enable **Two-factor authentication (2FA)** on Gravity website, so you need to install an *Authenticator* on your phone/PC.    
Any of the listed authenticators below (and many others) will work. You can first try to find and install one of these authenticators from the App Store of your device. Alternative, you can follow the links below to download and install one of them. 

#### *Android* device
```tip
If you cannot run *authenticator app* due to **ERROR**: **You do not have Google Services Framework installed**, please [install **Google Services Framework** here](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/%E8%B0%B7%E6%AD%8C%E6%A1%86%E6%9E%B6_%E5%AE%89%E8%A3%85%E5%99%A8.apk).   

若您无法运行认证器应用，**报错**提示：**您未安装谷歌框架**，请[在这里安装**Google Services Framework**](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/%E8%B0%B7%E6%AD%8C%E6%A1%86%E6%9E%B6_%E5%AE%89%E8%A3%85%E5%99%A8.apk)
```

- [Google Authenticator](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/Google_Authenticator_5.20R3.apk) (stored on Gravity, can be accessed from anywhere 🎉🎉🎉)
- [Microsoft Authenticator](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/Microsoft_Authenticator_6.2206.3973.apk) (stored on Gravity, can be accessed from anywhere 🎉🎉🎉)
- [Twilio Authy](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/Twilio_Authy_24.8.6.apk) (stored on Gravity, can be accessed from anywhere 🎉🎉🎉)
- [Duo Mobile](https://dl.duosecurity.com/DuoMobile-latest.apk) (official, can be accessed from China 🎉)
- [LastPass Authenticator](https://play.google.com/store/apps/details?id=com.lastpass.authenticator) (official, but you need to access Google Play 🙄)
- [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2) (official, but you need to access Google Play 🙄)
- [Microsoft Authenticator](https://www.microsoft.com/en-us/security/mobile-authenticator-app) (official, but you need to access Google Play 🙄)

#### *iOS* device
- [Google Authenticator](https://apps.apple.com/cn/app/google-authenticator/id388497605) (can be accessed in China 🎉🎉🎉)
- [Microsoft Authenticator](https://apps.apple.com/cn/app/microsoft-authenticator/id983156458) (can be accessed in China 🎉🎉)
- [Twilio Authy](https://apps.apple.com/cn/app/twilio-authy/id494168017) (can be accessed in China 🎉🎉🎉)
- [Duo Mobile](https://apps.apple.com/cn/app/duo-mobile/id422663827) (can be accessed in China 🎉🎉🎉)

#### Desktop
- [Authy](https://authy.com/download/) has desktop versions for windows, mac and linux.

### 2. add Gravity 2FA
open [Gravity Authentication webpage](https://gravity.sjtu.edu.cn/auth/), input your *username* + *password*

<img src="../images/Basic/auth_login.png" width = "300" height = "250" div align=center />

click *Register device* (choose **One-Time Pssword** method!!!)

<img src="../images/Basic/auth_add_device.png" width = "300" height = "250" div align=center />

check your mailbox, click *Register button*

<img src="../images/Basic/auth_email.png" width = "300" height = "200" div align=center />

open your phone's authenticator app

<img src="../images/Basic/auth_QR.png" width = "300" height = "250" div align=center />

click *add* button

<img src="../images/Basic/auth_add1.png" width = "180" height = "300" div align=center />

*scan* QR code

<img src="../images/Basic/auth_add2.png" width = "180" height = "300" div align=center />

input your *Time-based one-time password (TOTP)*, enjoy! 🎉🎉🎉

<img src="../images/Basic/auth_totp.png" width = "300" height = "250" div align=center />

# 登陆 Gravity（中文版）
```note
我们已在网站上启用*2FA*认证，您需要安装2FA应用才能够在网页端登陆    
若您使用ssh方式登陆，则仅需ssh private key私钥
```

```danger
请勿多次失败登陆，您的IP将会被封禁一段时间 😭   
```
## SSH登陆

### 1. 生成 ssh key 密钥对

生成 [ssh key](https://wiki.archlinux.org/title/SSH_keys_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)  
打开终端（Linux/Windows/Mac）：

```bash
ssh-keygen
# 回车
# 回车
# 回车
```

这将会生成两个文件：
- `id_rsa` (*私钥*)
- `id_rsa.pub` (*公钥*)

### 2. 将`公钥`添加至Gravity
在注册账号时，您已经提供了公钥，若一切正常，则忽略此步骤。

若您想要手动添加公钥：
- 使用*Jupyter*的终端，将公钥`id_rsa.pub`添加至`~/.ssh/authorized_keys`即可
- 将公钥`id_rsa.pub`通过[邮件发送](https://gravity-doc.github.io/#contact)给我们，我们将帮您添加。

### 3. 登陆
Gravity拥有两个登陆节点：
- 登陆节点一号 *login01* [ **`login01.gravity.sjtu.edu.cn`** ]（备用）
- 登陆节点二号 *login02* [ **`gravity.sjtu.edu.cn`** ]（主用）

```bash
ssh -i <你的私钥> <用户名>@gravity.sjtu.edu.cn
# 举个栗子 🌰
ssh -i /home/lalala/.ssh/id_rsa_For_Gravity lalala@gravity.sjtu.edu.cn
```

```tip
您可以设置 `~/.ssh/config` 来**简化**命令😎，按照下方操作：    
```

像这样修改文件`~/.ssh/config`：

```
Host login01
    HostName login01.gravity.sjtu.edu.cn
    User lalala
    Port 22
    IdentityFile ~/.ssh/id_For_Gravity
Host login02
    HostName gravity.sjtu.edu.cn
    User lalala
    Port 22
    IdentityFile ~/.ssh/id_rsa_For_Gravity
```

搞定！ 🥳 

```bash
ssh login01
ssh login02
```

### 软件
若您不喜欢😒原生的终端，这里有可选的软件：
- *[MobaXTerm](https://mobaxterm.mobatek.net/download.html)* (**Windows**)
- *[Xshell](https://www.netsarang.com/en/xshell/)*  (**Windows**)
- *[Putty](https://www.ssh.com/ssh/putty/download)*  (**Windows**)
- *[Bitvise](https://www.bitvise.com/ssh-client-download)* (**Windows**)
- *[Termius](https://termius.com/)* (**Mac/Linux/Windows/Android/iOS**)
- *[FinalShell](https://www.hostbuf.com/t/988.html)* (**Mac/Linux/Windows**)
- *[PortX](https://portx.online/zh/)* (**Mac/Linux/Windows**)
- *[WindTerm](https://github.com/kingToolbox/WindTerm)* (**Mac/Linux/Windows**) (🎉**open source**🎉)
- *[Tabby](https://tabby.sh/)* (**Mac/Linux/Windows**) (🎉**open source**🎉)
- *[iTerm](https://iterm2.com/)* (**Mac**)
- *[JuiceSSH](https://apkpure.com/juicessh-ssh-client/com.sonelli.juicessh)* (**Android**)
- *[Termux](https://github.com/termux/termux-app)* (**Android**) (🎉**open source**🎉)


## Web登陆
### 1. 安装authenticator应用
我们在网站上启用了二次验证（2FA），因此您需要在电脑/手机上安装软件后才能登陆。
下面列出的任意一款验证器都可以满足需求，您可以尝试从自己手机的官方应用商店安装，或者从点击下面的链接下载安装：

#### *Android* 设备
```tip
若您无法运行认证器应用，**报错**提示：**您未安装谷歌框架**，请[在这里安装**Google Services Framework**](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/%E8%B0%B7%E6%AD%8C%E6%A1%86%E6%9E%B6_%E5%AE%89%E8%A3%85%E5%99%A8.apk)
```

- [Google Authenticator](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/Google_Authenticator_5.20R3.apk) (存储在Gravity，可以从任何地方访问 🎉🎉🎉)
- [Microsoft Authenticator](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/Microsoft_Authenticator_6.2206.3973.apk) (存储在Gravity，可以从任何地方访问 🎉🎉🎉)
- [Twilio Authy](https://gravity.sjtu.edu.cn/file/api/public/dl/bjEJwMgn/apk/Twilio_Authy_24.8.6.apk) (存储在Gravity，可以从任何地方访问 🎉🎉🎉)
- [Duo Mobile](https://dl.duosecurity.com/DuoMobile-latest.apk) (官方, 可以在中国访问 🎉)
- [LastPass Authenticator](https://play.google.com/store/apps/details?id=com.lastpass.authenticator) (官方， 但是你需要能够访问Google Play商店 🙄)
- [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2) (官方， 但是你需要能够访问Google Play商店 🙄)
- [Microsoft Authenticator](https://www.microsoft.com/en-us/security/mobile-authenticator-app) (官方， 但是你需要能够访问Google Play商店  🙄)

#### *iOS* 设备
使用AppStore直接安装即可：
- [Google Authenticator](https://apps.apple.com/cn/app/google-authenticator/id388497605) (中国正常访问 🎉🎉🎉)
- [Microsoft Authenticator](https://apps.apple.com/cn/app/microsoft-authenticator/id983156458) (中国正常访问 🎉🎉🎉)
- [Twilio Authy](https://apps.apple.com/cn/app/twilio-authy/id494168017) (中国正常访问 🎉🎉🎉)
- [Duo Mobile](https://apps.apple.com/cn/app/duo-mobile/id422663827) (中国正常访问 🎉🎉🎉)

### 2. 添加Gravity的二次验证
打开 [Gravity认证页面](https://gravity.sjtu.edu.cn/auth/), 输入您的 *用户名* + *密码*

<img src="../images/Basic/auth_login.png" width = "300" height = "250" div align=center />

点击 *注册设备* （选择**One-Time password**方式！！！）

<img src="../images/Basic/auth_add_device.png" width = "300" height = "250" div align=center />

检查您的邮箱，点击 *注册* 按钮

<img src="../images/Basic/auth_email.png" width = "300" height = "200" div align=center />

打开您手机上的 authenticator 应用，准备扫描二维码

<img src="../images/Basic/auth_QR.png" width = "300" height = "250" div align=center />

点击*加号*按钮

<img src="../images/Basic/auth_add1.png" width = "180" height = "300" div align=center />

点击*扫描二维码*

<img src="../images/Basic/auth_add2.png" width = "180" height = "300" div align=center />

输入您的 *二次验证码*, 开始征途吧！🎉🎉🎉

<img src="../images/Basic/auth_totp.png" width = "300" height = "250" div align=center />

# SGI login

```tip
1. **SGI** is a **standalone** machine, and it has a different OS and disk system.   
2. **SGI** use *slurm* rather than *pbs* as the job scheduler.   
   
**NEW**: **SGI** account is the same as **Gravity** account, you can use the same username and password to log in both **SGI** and **Gravity**.
```

You cannot access **SGI** directly, you need to log in **Gravity** first, then on login nodes, use:

```bash
ssh sgi
```

Here we go 🎉