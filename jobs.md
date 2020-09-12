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
`qsub [-a date_time] [-c interval] [-C directive_prefix] [-e path] [-I] [-j join] [-k keep] [-l resource_list] [-m mail_options] [-M user_list][-N name] [-o path] [-p priority] [-q destination] [-r c] [-S path_list] [-u user_list][-v variable_list] [-V] [-W additional_attributes] [-z] [script]`
We recommend to submit jobs via the job scripts.
`qsub JOB_SCRIPT`
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

`qstat [-f][-a][-i] [-n][-s] [-R] [-Q][-q][-B][-u]`

`qdel [-W time] JOB_ID`




