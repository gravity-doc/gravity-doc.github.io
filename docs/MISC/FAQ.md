
# FAQ

> [!TIP]
> If there is **NO** solution of your problem, feel free to [contact us](/?id=contact)!
> 

## Permission denied

I got a **permission denied** error when trying to login with ssh

- your ip is **banned** (see below)
- you forgot to use *ssh-key* to login
- your `~/.ssh/authorized-keys` file on the server has the wrong permissions
  - `~/.ssh` should have permission `700` 
  - `~/.ssh/authorized-keys` should have permission `600`)

  contact the admin to fix the permission
 
You may be able to find out more information about the issue by adding the `-vvv` option to ssh, i.e., `ssh -vvv`.

## Forgot password

What if I forgot my password? 🔐

- [go to web authentication](https://jupyter.gravity.sjtu.edu.cn/auth/) to reset your password
- [send an **E-mail**](mailto:gravity-hpc@sjtu.edu.cn) with your *username*, we will help you to reset the password (it will take several hours maybe)

## Forgot ssh key

What if I lost my *ssh-key*? 🛡️

- [Send an **E-mail**](mailto:gravity-hpc@sjtu.edu.cn) to us, including your [**ssh public key**](/Basic/Login?id=_1-generate-ssh-key) and your **username**   

PS. You'd better use **@sjtu.edu.cn**, so that we can recognize who you really are 👀    

> [!TIP]
> You may be prompted for a passphrase when login with a ssh-key. This is the password you set-up to protect the key when generating your ssh-key. It is **different** from the password you use for jupyter.
> 

## IP banned

What if my **IP** was **banned** ❌, so that I couldn't access **[JupyterHub](https://gravity.sjtu.edu.cn/)** or **ssh login**?

- [Check you IP here](https://ipinfo.io/), then contact us and tell us **your IP**

## Extend time of job

Can I extend my time of running PBS job? ⌛

- Sure! Contact us and tell us how much time you need.

## Add disk storage space

I want more **Disk storage space** 💾

1. contact your advisor, get his/her permission
2. contact admins to increase your disk quota

## Job never start

My PBS job is always waiting 😤

- Use `checkjob <JobID>` to check the **reason**.
- Use `showstart <JobID>` to see how much time is left to **start your job**.

## Job failed

My PBS job cannot run successfully 🙄

- Check your **error file** and **output file** such as `xxx.e<JOBID>` and `xxx.o<JOBID>`
- you can run your program on the **login nodes** first to test.

## WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!

when you **ssh log in** *Gravity*, if you meet Warning:

```text
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED! @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that the RSA host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
08:98:a9:cc:f8:37:20:6b:b4:b1:6c:3a:15:b9:a9:92.
Please contact your system administrator.
Add correct host key in /home/lalala/.ssh/known_hosts to get rid of this message.
Offending key in /home/lalala/.ssh/known_hosts:2
RSA host key for gravity.sjtu.edu.cn has changed and you have requested strictecking.
Host key verification failed.
```

Don't worry, just delete the **specific row** of `~/.ssh/known_hosts` anderything will be OK      
From the *Warning*，you can see `Offending key in /home/lalala/.ssh/known_hosts:2`, so we just need to remove the **2nd row**.    

## binary file can not be executed

## source code string cannot contain null bytes

`binary file can not be executed` or `source code string cannot contain null bytes` 👉 [issue of conda](/MISC/Issues?id=conda)   

  > I am *so sorry* to tell you that your whole **CONDA** installation is destroyed. Cause this is a tricky bug🐛, we cannot fix it 😭.        
  >
  > You should re-install your conda, and **never** install/update any package on **login01**.

## Job logfile is empty

My job is *running* but my logfile is still **empty**?   

- This is probably because your log messages are being buffered on the computing node. You can try log into the computing node and check /var/spool/torque/spool/ to find the buffered logfile.
- `python -u xxxxx.py` will disable the buffer.

**Refs:**   
> https://guido.vonrudorff.de/2013/pbstorque-unbuffered-output-on-network-filesystems/
> https://serverfault.com/questions/294218/is-there-a-way-to-redirect-output-to-a-file-without-buffering-on-unix-linux
