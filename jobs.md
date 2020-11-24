---
sort: 5
---

# Job submission

**Gravity** uses PBS to manage jobs.
This page provides basic usage of the PBS commands.  

## Example scripts
The content of an example PBS script (`example.qsub`) is provided below:
```bash
  #PBS -N gr01-linpack
  #PBS -l nodes=gr01:ppn=72
  #PBS -q normal
  #PBS -V
  #PBS -S /bin/bash
  #PBS -W group_list=project2

  cd $PBS_O_WORKDIR
  mpirun -np 72 exec
```

```note
the `group_list` argument is your project name to charge time if you have one. Otherwise delete this option, and the cputime will be charged to your default group.
```

To submit the job,
```bash:
qsub example.qsub
```

See [this section](https://gravity-doc.github.io/samples/) for more example job scripts.

## Queues

**Gravity** has three job queues, **normal**, **small**, and **fat**.

Jobs in **normal** queue can apply computing nodes **gr01** to **gr32**.
To use fat node, use **fat** queue.
Queue **small** is reserved for specific users.


## PBS commands

### submit a new job

One can submit a job via the `qsub` command.

`qsub` `[-a date_time]` `[-c interval]` `[-C directive_prefix]` `[-e path]`
`[-I]` `[-j join]` `[-k keep]` `[-l resource_list]` `[-m mail_options]`
`[-M user_list]` `[-N name]` `[-o path]` `[-p priority]` `[-q destination]`
`[-r c]` `[-S path_list]` `[-u user_list]` `[-v variable_list]` `[-V]`
`[-W additional_attributes]` `[-z]` `[script]`

We recommend submit jobs via the job scripts, `qsub JOB_SCRIPT`.
For job script sample, check the [samples](samples).

### check the job status
`qstat` can show the status of all the jobs in **S** column. 
S, R, Q, C, E means 
```bash
[testuser@GRAVITY:~]:qstat
Job ID                    Name             User            Time Use S Queue
------------------------- ---------------- --------------- -------- - -----
1276.login01               athena++         user1             3342:50: R small
1277.login01               athena++         user1                    0 Q small
1352.login01               run_velprof      user3           1257:36: R fat
```
Use `qstat -u USERNAME` to show the jobs submitted by one user.

### cancel a job
`qdel [-W time] JOB_ID`
`-W time` can specify the delay of the job cancel.  The unit is seconds.

### check pending status
`checkjob JOB_ID` can provide the information of a pending job.

### references

```note
`qsub` `[-a date_time]` `[-c interval]` `[-C directive_prefix]` `[-e path]`
`[-I]` `[-j join]` `[-k keep]` `[-l resource_list]` `[-m mail_options]`
`[-M user_list]` `[-N name]` `[-o path]` `[-p priority]` `[-q destination]`
`[-r c]` `[-S path_list]` `[-u user_list]` `[-v variable_list]` `[-V]`
`[-W additional_attributes]` `[-z]` `[script]`  
-a  date_time ： delay the job with time [[[[CC]YY]MM]DD]hhmm[.SS]    
-c  interval   ： 定义作业的检查点间隔，如果机器不支持检查点，则忽略此选项。  
-C  directive_prefix ：treat all lines begin with directive_prefix as qsub option. Otherwise, qsub option begins with '#PBS'
-e  path     ：specify error file  
-I           ：interactive  
-j  join     ：join output and error file. 
-l  resource_list  ： define resource list as follow       
walltime=N         ： wall time in unit of second, or in the form of hh:mm:ss       
mem=N[K|M|G][B|W]：define memory usage      
nodes=N:ppn=M     ：define number of nodes N and processes per node M.  
-m  mail_options ：mail_option为a：作业abort时给用户发信；为b：作业开始运行发信；为e：作业结束运行时发信。若无此选项，默认为a。  
-M  user_list    ： mail addresss  
-N  name         ： jobname, less than 15 characters.   
-o  path         ： specify output file  
-p  priority     ： adjust priority, [-1024，1023]，default 0.  
-q  destination  ： specify which queue to use
-r  y|n          ： 指明作业是否可运行，y为可运行，n为不可运行。  
-S  shell        ： specify the SHELL to use, full path.    
-u  user_list    ： specify the user to run the job  
-v  variable_list ： specify the environment variable list to export to this job.   
-V                ： export all environment variable to this job.    
-W  additional_attributes  ：   
-z               ： do not show JOB_ID information after submission  
```

```note
`qstat` `[-f JOB_ID]` `[-a]` `[-i]` `[-n]` `[-s]` `[-R]` `[-Q [QUEUE]]` `[-q]` `[-B]` `[-u USER]`  
-f JOB_ID : specify the job  
-a        : list all the jobs  
-i        : list all non-running jobs 
-r        : list all the running jobs  
-n        : list the nodes assigned to jobs  
-s         : 列出队列管理员与scheduler所提供的建议  
-R         : 列出磁盘预留信息  
-Q [QUEUE] : list queue status
-q [QUEUE] : list queue status 
-B         : list PBS Server information 
-u USER    : list the jobs for USER 
```

## References
- [qsub doc](http://docs.adaptivecomputing.com/torque/4-1-3/help.htm#topics/commands/qsub.htm)
- `man qsub`
- `man pbs_resources`

