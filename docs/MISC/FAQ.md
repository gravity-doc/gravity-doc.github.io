---
sort: 1
title: FAQ
---

```note
If there is **NO** solution of your problem, feel free to [contact us](https://gravity-doc.github.io/#Contact)!
```

# FAQ

- What if I forgot my password?

  > Do not worry, contact us to change the password      
  >
  > You'd better use **@sjtu.edu.cn**, so that we can recognize who you really are 👀

- I can not login *Gravity* using my *ssh private key*

  > [Send an **E-mail**](mailto:gravity-hpc@sjtu.edu.cn) to us, including your **ssh public key** and your **username**   
  > You'd better use **@sjtu.edu.cn**, so that we can recognize who you really are 👀    

```tip
You should use **private key** to log in to Gravity like this:
`ssh -i ~/.ssh/id_rsa_For_Gravity username@gravity.sjtu.edu.cn`    
The **public key** should be on the *Gravity* -> `~/.ssh/authorized_keys`   
Keep your **private key** safe, it is identical to **password**!
```

- What if my **IP** was **banned**, so that I couldn't access **[JupyterHub](https://gravity.sjtu.edu.cn/)** or **ssh login**?

  > Contact us and tell us **your IP**

- Can I extend my time of running PBS job?

  > Sure! Contact us and tell us how much time you need.

- My PBS job is always waiting 😤

  > Use `checkjob <JobID> ` to check the **reason**.     
  >
  > Use `showstart <JobID>` to see how much time is left to **start your job**.

- My PBS job cannot run successfully 🙄

  > Check your **error file** and **output file** such as `xxx.e<JOBID>` and `xxx.o<JOBID>`   
  >
  > Also, you can run your program on the login nodes first to test.
