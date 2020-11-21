---
sort: 4
---
# Resource Monitoring

## Web interface
You can check the status of jobs and queues through the [ClusterEngine](https://111.186.40.52:8443) webpage.

## Command line tools
### user information

```bash
[inspur03@login01 ~]$ finger inspur
Login: inspur         			Name: Shiyu Tan
Directory: /home/inspur             	Shell: /bin/bash
Office: sytan
Last login Thu Oct 15 09:14 (CST) on 
No mail.
No Plan.
```

```tip
More complete user information is available on login01.
```

### disk quota

On login02, 
```bash
[inspur03@login02 ~]$ icfsquota inspur03
max_size=3T,used=8.3GB
```

### nodes 
The following commands provide the status of job queue system.

`pestat` provides the CPU and memory usage of all the nodes.
```bash
[testuser@GRAVITY:~]:pestat
node	 state	 load	 pmem	 ncpu	 mem	 resi	 usrs	 tasks	 jobids/users
gr01	 free 	 0.00 	 385382	  72	 417382	  14929 	 0/0 	   0
gr02	 free 	 2.08*	 385382	  72	 417382	  17059 	 0/0 	   0
...
gr17	 free 	 6.05*	 385382	  72	 417382	   6078 	 0/0 	   0
gr18	 excl 	 63.94*	 385382	  72	 417382	  63881 	 65/1 	   1 	 [1345:user1]
...
gr31	 excl 	 72.00*	 385382	  72	 417382	  58531 	 87/1 	   1 	 [1345:user1]
gr32	 free 	 1.25 	 385382	  72	 417382	  68937 	 1/1 	   1 	 [1342:user2]
gr33	 free 	 64.00*	 385382	  72	 417382	  76560 	 65/1 	   1 	 [1276:user3]
...
gr36	 free 	 63.96*	 385382	  72	 417382	  76529 	 69/1 	   1 	 [1276:user3]
fat01	 free 	 192.02* 6191128  192	 6223128  1284016 	 1/1 	   1 	 [1340:user4]
```


PSB job management provides `pbsnodes -l all` to check whether the nodes is free or occupied.
```bash
[testuser@GRAVITY:~]:pbsnodes -l all
gr01                 free
...
gr17                 free
gr18                 job-exclusive
...
gr31                 job-exclusive
...
gr36                 free
fat01                free
```

### queue status

`showq` provides the queue information.
```bash
[testuser@GRAVITY:~]:showq
ACTIVE JOBS--------------------
JOBNAME            USERNAME      STATE  PROC   REMAINING            STARTTIME

1342                  user2    Running     1    21:07:51  Sat Sep 12 09:12:13
1345                  user1    Running  1008    22:59:41  Sat Sep 12 11:04:03
1276                  user3    Running   256  1:06:07:10  Thu Sep 10 18:11:32
1340                  user4    Running    96  2:11:21:33  Fri Sep 11 23:25:55

     4 Active Jobs    1361 of 2784 Processors Active (48.89%)
                        20 of   37 Nodes Active      (54.05%)

IDLE JOBS----------------------
JOBNAME            USERNAME      STATE  PROC     WCLIMIT            QUEUETIME

1277                  user3       Idle   256  3:00:00:00  Thu Sep 10 18:11:29

1 Idle Job

BLOCKED JOBS----------------
JOBNAME            USERNAME      STATE  PROC     WCLIMIT            QUEUETIME


Total Jobs: 5   Active Jobs: 4   Idle Jobs: 1   Blocked Jobs: 0
```

One can also use `qstat` and `qstat -an` to check basic and detailed queue information.

```bash
[testuser@GRAVITY:~]:qstat -an
login01:
                                                                                  Req'd       Req'd       Elap
Job ID                  Username    Queue    Jobname          SessID  NDS   TSK   Memory      Time    S   Time
----------------------- ----------- -------- ---------------- ------ ----- ------ --------- --------- - ---------
1276.login01            user1         small    athena++          13962     4    256       --   72:00:00 R  42:01:48
   gr36/0-63+gr35/0-63+gr34/0-63+gr33/0-63
1277.login01            user1         small    athena++            --      4    256       --   72:00:00 Q       --
    --
1340.login01            user2         fat      run_velprof      132765     1     96    1800gb  72:00:00 R  12:47:25
   fat01/0-95
1342.login01            user3         normal   test             173700     1      1       --   24:00:00 R  03:01:07
   gr32/0
1345.login01            user4         normal   imgBDK           181608    14   1008       --   24:00:00 R  01:09:17
   gr31/0-71+gr30/0-71+gr29/0-71+gr28/0-71+gr27/0-71+gr26/0-71+gr25/0-71
   +gr24/0-71+gr23/0-71+gr22/0-71+gr21/0-71+gr20/0-71+gr19/0-71+gr18/0-71
```
