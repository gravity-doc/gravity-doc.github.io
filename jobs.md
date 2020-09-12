---
sort: 5
---

# Job submission

**Gravity** uses PBS to manage jobs.
This page provides basic usage of the PBS commands.  For detailed information please 自行百度。

## Queues

**Gravity** has three job queues, **normal**, **small**, and **fat**.

Jobs in **normal** queue can apply computing nodes **gr01** to **gr32**.
To use fat node, use **fat** queue.
Queue **small** is reserved for specific users.

## PBS commands

### submit a new job

One can submit a job via the `qsub` command.

`qsub [-a date_time] [-c interval] [-C directive_prefix] [-e path]`
`[-I] [-j join] [-k keep] [-l resource_list] [-m mail_options]`
`[-M user_list][-N name] [-o path] [-p priority] [-q destination]`
`[-r c] [-S path_list] [-u user_list][-v variable_list] [-V]`
`[-W additional_attributes] [-z] [script]`

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

`qsub [-a date_time] [-c interval] [-C directive_prefix] [-e path] [-I] [-j join] [-k keep] [-l resource_list] [-m mail_options] [-M user_list][-N name] [-o path] [-p priority] [-q destination] [-r c] [-S path_list] [-u user_list][-v variable_list] [-V] [-W additional_attributes] [-z] [script]`

-a  date_time ： date_time格式为：[[[[CC]YY]MM]DD]hhmm[.SS] 表示经过date_time时间后作业才可以运行。

-c  interval   ： 定义作业的检查点间隔，如果机器不支持检查点，则忽略此选项。

-C  directive_prefix ：在脚本文件中以directive_prefix开头的行解释为qsub的命令选项。（若无此选项，则默认为’#PBS’ ）

-e  path     ：将标准错误信息重定向到path

-I           ：以交互方式运行

-j  join     ：将标准输出信息与标准错误信息合并到一个文件join中去。

-k  keep     ：定义在执行结点上保留标准输出和标准错误信息中的哪个文件。  keep为o 表示保留前者，e表示后者，oe或eo表示二者都保留，n表示皆不保留。若忽略此选项，二者都不保留。

-l  resource_list  ： 定义资源列表。

以下为几个常用的资源种类。   

cput=N         ： 请求N秒的CPU时间; N也可以是hh:mm:ss的形式。    

mem=N[K|M|G][B|W]：请求N {kilo|mega|giga}{bytes|words} 大小的内存。    

nodes=N:ppn=M     ：请求N个结点，每个结点M个处理器。

-m  mail_options ：mail_option为a：作业abort时给用户发信；为b：作业开始运行发信；为e：作业结束运行时发信。若无此选项，默认为a。

-M  user_list    ： 定义有关此作业的mail发给哪些用户。

-N  name         ： 作业名，限15个字符，首字符为字母，无空格。

-o  path         ： 重定向标准输出到path。

-p  priority     ： 任务优先级，整数，[-1024，1023]，若无定义则为0.

-q  destination  ： destination有三种形式： queue , @server,queue@server。

-r  y|n          ： 指明作业是否可运行，y为可运行，n为不可运行。

-S  shell        ： 指明执行运行脚本所用的shell，须包含全路径。

-u  user_list    ： 定义作业将在运行结点上以哪个用户名来运行。

-v  variable_list ： 定义export到本作业的环境变量的扩展列表。

-V                ： 表明qsub命令的所有环境变量都export到此作业。

-W  additional_attributes  ： 作业的其它属性。

-z               ： 指明qsub命令提交作业后，不在终端显示作业号。


`qstat [-f][-a][-i] [-n][-s] [-R] [-Q][-q][-B][-u]`

-f  jobid  列出指定作业的信息

-a         列出系统所有作业

-i         列出不在运行的作业

-n         列出分配给此作业的结点

-s         列出队列管理员与scheduler所提供的建议

-R    列出磁盘预留信息

-Q         操作符是destination id，指明请求的是队列状态  

-q         列出队列状态，并以alternative形式显示

-au userid 列出指定用户的所有作业

-B         列出PBS Server信息

-r         列出所有正在运行的作业

-Qf queue  列出指定队列的信息

-u         若操作符为作业号，则列出其状态。若操作符为destination id，则列出运行在其上的属于user_list中用户的作业状态。

例：# qstat -f 211 查询作业号为211的作业的具体信息。

`qdel [-W time] JOB_ID`





