---
sort: 1
title: FAQ
---

# FAQ

```note
If there is **NO** solution of your problem, feel free to [contact us](https://gravity-doc.github.io/#contact)!
```

- I got a permission denied error when trying to login with ssh
  
  > This may be because 
  > - your ip is banned (see below), 
  > - or because you didn't use your ssh-key to login (see below), 
  > - or because your .ssh/authorized-keys file on the server has the wrong permissions (.ssh should have permission 700 and authorized_keys 644 or 600). Contact the admins to fix the permission in this case.
  > 
  > You may be able to find out more information about the issue by adding the `-vvv` option to ssh, i.e., `ssh -vvv`.

- What if I forgot my password? 🔐

  > Do not worry, contact us to change the password      
  > You'd better use **@sjtu.edu.cn**, so that we can recognize who you really are 👀

- I can not login *Gravity* using my *ssh private key* 🛡️

  > [Send an **E-mail**](mailto:gravity-hpc@sjtu.edu.cn) to us, including your [**ssh public key**](https://gravity-doc.github.io/Basic/Login.html#generate-ssh-keys) and your **username**   
  > You'd better use **@sjtu.edu.cn**, so that we can recognize who you really are 👀    
  >
  > ```tip
  > You should use **private key** to log in to Gravity like this:   
  > `ssh -i ~/.ssh/id_rsa_For_Gravity username@gravity.sjtu.edu.cn`    
  > The **public key** should be on the *Gravity* -> `~/.ssh/authorized_keys`   
  > 
  > Keep your **private key** safe, it is equivalent to a **password**!
  > ```

  > ```tip
  > You may be prompted for a passphrase when login with a ssh-key. This is the password you set-up to protect the key when generating your ssh-key. It is separate from the password you use for jupyter.
  > ```

- What if my **IP** was **banned** ❌, so that I couldn't access **[JupyterHub](https://gravity.sjtu.edu.cn/)** or **ssh login**?

  > Contact us and tell us **your IP**

- Can I extend my time of running PBS job? ⌛

  > Sure! Contact us and tell us how much time you need.

- I want more **Disk storage space** 💾

  > 1. contact your advisor, get his/her permission
  > 2. contact admins to increase your disk quota

- My PBS job is always waiting 😤

  > Use `checkjob <JobID> ` to check the **reason**.     
  >
  > Use `showstart <JobID>` to see how much time is left to **start your job**.

- My PBS job cannot run successfully 🙄

  > Check your **error file** and **output file** such as `xxx.e<JOBID>` and `xxx.o<JOBID>`   
  >
  > Also, you can run your program on the login nodes first to test.

- `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!`   

  > when you **ssh log in** *Gravity*, sometimes it will appear such kind of warning:
  >
  > ```
  > @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  > @ WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED! @
  > @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  > IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
  > Someone could be eavesdropping on you right now (man-in-the-middle attack)!
  > It is also possible that the RSA host key has just been changed.
  > The fingerprint for the RSA key sent by the remote host is
  > 08:98:a9:cc:f8:37:20:6b:b4:b1:6c:3a:15:b9:a9:92.
  > Please contact your system administrator.
  > Add correct host key in /home/lalala/.ssh/known_hosts to get rid of this message.
  > Offending key in /home/lalala/.ssh/known_hosts:2
  > RSA host key for gravity.sjtu.edu.cn has changed and you have requested strict checking.
  > Host key verification failed.
  > ```
  >
  > Don't worry, just delete the **specific row** of `~/.ssh/known_hosts` and everything will be OK      
  >
  > From the *Warning*，you can see `Offending key in /home/lalala/.ssh/known_hosts:2`, so we just need to remove the **2nd row**.    

- `binary file can not be executed` 👉 [issue of conda](https://gravity-doc.github.io/MISC/Issues.html#conda)   

  > I am *so sorry* to tell you that your whole **CONDA** installation is destroyed. Cause this is a tricky bug🐛, we cannot fix it 😭.        
  >
  > You should re-install your conda, and **never** install/update any package on **login01**.

- `Permission denied (publickey,gssapi-keyex,gssapi-with-mic)`    

  > 1. the `private key` in your hand doesn't match `public key` on *Gravity* 👇   
  >
  >    > [Send an **E-mail**](mailto:gravity-hpc@sjtu.edu.cn) to us, including your [**ssh public key**](https://gravity-doc.github.io/Basic/Login.html#generate-ssh-keys) and your **username**
  >
  > 2. you just don't use `private key` at all! 👇    
  >
  >    >  `ssh -i <your_ssh_key> <username>@gravity.sjtu.edu.cn`    
- My job is running but my logfile is still empty.

  This is probably because your log messages are being buffered on the computing node. You can try log into the computing node and check /var/spool/torque/spool/ to find the buffered logfile.
  Refs: 
  * https://guido.vonrudorff.de/2013/pbstorque-unbuffered-output-on-network-filesystems/
  * https://serverfault.com/questions/294218/is-there-a-way-to-redirect-output-to-a-file-without-buffering-on-unix-linux
