# FAQ/Issues

```tip
If there is **no** solution of your problem, feel free to [contact us](https://gravity-doc.github.io/#Contact)!
```



## FAQ

- What if I forgot my password?

  > Do not worry, contact us to change the password

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

  > Use `checkjob <JobID> ` to check the reason.
  >
  > Use `showstart <JobID>` to see how much time is left to start your job.

- My PBS job cannot run successfully 🙄

  > Check your **error file** and **output file** such as `xxx.e<JOBID>` and `xxx.o<JOBID>`
  >
  > Also, you can run your program on the login nodes first to test.


## Issues
```danger
### **Never ever** install/update any package at *login01* using `conda/mamba`
Otherwise, your whole conda environment will be destroyed!
- You can use `pip install` instead
- You can go to *login02* to use `conda/`
```
- Anaconda
One recieves '**binary file can not be executed**' after installing of Anaconda latest version (2020-05). 
The same happens when update conda from old version.
This issue is due to incompatiblity of the **parallel file system** mounted in kernel state. 
As a temporary workaround, we have mounted the filesystem with **NFS on login02**, so that you can use login02 for installation and update of anaconda packages. This means degraded IO performance on login02 (~700MB/s), but it should suffice common usage requirements. If high IO performance is needed interactively, use login01.

- 日志残留问题
  问题描述:当用户提交两个节点以上的任务时，就会出现日志残留问题。
  ```bash
  [inspur@login02 gr01]$ cat inspur-test-3.e2619
  cgdelete: cannot remove group 'gr28.2619.login01': No such file or directory
  ```
  此问题涉及内核模块cgroup，不会影响作业的正常运行，用户遇到该问题可暂时忽略，目前仍在定位问题。

- compiler/intel-2020 module无法使用的问题
  目前intel2020跟module适配存在问题，使用module load compiler/intel-2020载入环境变量无法生效。

  如果需要使用intel2020，可以直接写source路径，或者通过source载入。

  ```bash
  source /opt/intel-2020.sh
  ```

- openmpi-4.0.4
High version *openmpi* use UCX (Unified Communication X) as the default pml (Physical Markup Language).
You need to specify this in the running command.
```bash
mpirun -np 4 --mca pml ucx ./a.out
```
[For more details.]{https://github.com/openucx/ucx/wiki/OpenMPI-and-OpenSHMEM-installation-with-UCX}

- Performance issue on fat01
The current hardware architecture of fat01 has a limited memory bandwidth which could become a bottleneck for memory intensive jobs. For example, for large memory (e.g., >2TB) OpenMP jobs, it may take longer to run using 48 or more cores than using 24 cores. When the memory usage of the system is high, the overall performance of the system will also degrade. One may also experience very slow IO speed under such situations. So it is advised to first do some test runs to pick an optimal number of threads to use. 
