---
sort: 10
title: Example Job scripts
---

A basic job script looks like this
```bash
#PBS -N JOB_NAME
#PBS -l nodes=2:ppn=72
#PBS -q normal

### Set environment###
module load compiler/intel-2018

mpirun -np 2 EXEC
```

```tip
check `mpirun --help` for more arguments.
```

A relatively complete job script header is as follow
```bash
#PBS -N JOB_NAME
#PBS -l nodes=2:ppn=72
#PBS -l walltime=1:00:00
#PBS -q normal
#PBS -W YOUR_GROUP
#PBS -V
#PBS -j oe
#PBS -o OUTPUT_NAME
#PBS -S /bin/bash
```


The following PBS environment variable list is output by `env | grep PBS`, which maybe useful in your scripts.
```bash
PBS_VERSION=TORQUE-6.0.2
PBS_JOBNAME=aaa
PBS_ENVIRONMENT=PBS_BATCH
PBS_O_WORKDIR=/home/user1
PBS_TASKNUM=1
PBS_O_HOME=/home/user1
PBS_WALLTIME=25920000
PBS_MOMPORT=15003
PBS_GPUFILE=/opt/tsce4/torque6/share/gr32/aux//1399.login01gpu
PBS_O_QUEUE=normal
PBS_O_LOGNAME=user1
PBS_O_LANG=en_US.utf8
PBS_JOBCOOKIE=24CA13DFB269BB24B9E687EE94037901
PBS_NODENUM=0
PBS_NUM_NODES=1
PBS_O_SHELL=/bin/bash
PBS_JOBID=1399.login01
PBS_O_HOST=login02
PBS_VNODENUM=0
PBS_QUEUE=normal
PBS_O_MAIL=/var/spool/mail/user1
PBS_O_SUBMIT_FILTER=/opt/tsce4/torque6/bin/submitfilter.sh
PBS_MICFILE=/opt/tsce4/torque6/share/gr32/aux//1399.login01mic
PBS_NP=1
PBS_O_SERVER=login01
PBS_NUM_PPN=1
PBS_NODEFILE=/opt/tsce4/torque6/share/gr32/aux//1399.login01
PBS_O_PATH=/usr/java/jre1.8.0_151/bin:/usr/java/jre1.8.0_151/bin:/opt/tsce4/maui/sbin:/opt/tsce4/maui/bin:/opt/tsce4/torque6/bin:/opt/tsce4/torque6/sbin:/usr/local/bin:/usr/local/bin:/usr/lib64/qt-3.3/bin:/home/user1/perl5/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/ibutils/bin:/opt/pdsh-2.29/bin:/opt/pdsh-2.29/sbin:.:/home/user1/.local/bin:/home/user1/bin
```
