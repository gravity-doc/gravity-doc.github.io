---
sort: 3
title: Job
---

```warning
You **should** run your job via PBS (Torque).     
You can **ONLY** do some **simple** jobs on the **login nodes**, otherwise, you might crash the system and be *banned*.

Please only request resources that you actually need. **Do not** use more than or less than the number of cores you requested.
```

# Queues

`qstat -q ` shows a summary of available queues.

`qstat -f -Q` shows the detailed queue configurations, which are also listed below:

## Ordinary queues

| Queue name | Max  nodes | Max time | Max memory per node |        Priority         |
| :--------: | :--------: | :------: | :-----------------: | :---------------------: |
|  *debug*   |     1      | 3 hours  |       376 GB        |          High           |
|  *small*   |     3      | 72 hours |       376 GB        |         Medium          |
|  *normal*  |     18     | 48 hours |       376 GB        | Low (**default queue**) |

## **Special** queues

| Queue name |             Node             | Max time | Max memory per node  | Note                                                                                                                     |
| :--------: | :--------------------------: | :------: | :------------------: | :----------------------------------------------------------------------------------------------------------------------- |
|   *gpu*    | gr01<br>gr02<br>gr03<br>gr04 | 72 hours |        376 GB        | **NVIDIA Tesla V100 (32G)**<br>**NVIDIA Tesla V100 (32G)**<br>**NVIDIA Tesla V100 (32G)**<br>**NVIDIA Tesla A100 (80G)** |
|   *fat*    |    gr35<br>gr36<br>fat01     | 72 hours | 754GB<br>3TB<br>6 TB | **large shared-memory** jobs  (**mem > 360GB**)                                                                          |

# Submission

## Basic example


### Serial job

Suppose you have a program `test.f90` which is compiled as follows:

```bash
module load gcc
gfortran test.f90 -o test.exe
```

A simply job submission script (`example.qsub`) is as follow.

```bash
#!/bin/sh
#PBS -N testjob
#PBS -l nodes=1:ppn=1
#PBS -q normal

cd $PBS_O_WORKDIR

### load the modules ###
module load gcc && echo $_ "LOADED"

### RUN ###
./test.exe 
```

To submit the job,

```bash
qsub example.qsub
```

### parallel job
The content of an example *parallel* PBS script (`example.qsub`) is provided below:

```bash
#!/bin/bash
#PBS -N My_job
#PBS -l nodes=1:ppn=72
#PBS -q normal

# run your own program!!!
cd $PBS_O_WORKDIR
mpirun -np 72 exec
```


To submit the job,

```bash
qsub example.qsub
```

```tip
Please only request resources that you actually need. In the above example, a full node (72 cores) is requested. However, if your job uses fewer cores, you should only request that many cores. For example
`#PBS -l nodes=1:ppn=8`
to request 8 cores on a single node.

If your job uses OpenMP, you should set the number of threads to match your requested cores. For example, when requesting 8 cores for an OpenMP job, remember to also put the following in your job script before your final program line:
`export OMP_NUM_THREADS=8`
.

If you are running a serial job, please only request **one** core:
`#PBS -l nodes=1:ppn=1`
```

## Complete example

> job name is `My_job`.       
> E-mail address is `lalala@sjtu.edu.cn`.    
> need 1 node 72 cores per node   
> need 360GB memory `mem=360gb `  
> need at most 48 hours   
> make all of the output including error to `/home/lalala/code/my_output.log`   

```bash
#!/bin/bash
#PBS -N My_job
#PBS -m abe 
#PBS -M lalala@sjtu.edu.cn
#PBS -l nodes=1:ppn=72
#PBS -l mem=360gb
#PBS -l walltime=48:00:00
#PBS -q normal
#PBS -j oe
#PBS -o /home/lalala/code/my_output.log

echo running with ${PBS_NP} processes on ${PBS_NUM_NODES} nodes

# run your own program!!!
cd $PBS_O_WORKDIR
mpirun -np 72 exec

echo Done!
```

## More Examples
### Interactive job

To request resources for doing something interactively, you can submit an interactive job.

For example:

```bash
qsub -l nodes=1:ppn=4,mem=8gb,walltime=12:00:00 -q normal -I
```

You will be logged onto the assigned node once the above job get running, and you can start to run your actual computation interactively. 

```warning
- Please use the system responsibly and only start an interactive job when necessary. 

- Do not use more resources than requested, otherwise you might affect other jobs or crash the node.

- CPU time will be charged in the same way as normal jobs. Remember to log out of the computing node to end the interactive job. 

```

Reference: [https://www.msi.umn.edu/content/interactive-queue-use-qsub](https://www.msi.umn.edu/content/interactive-queue-use-qsub)

```tip
The following PBS environment variable list is output by `env | grep PBS`, which maybe useful in your scripts.
```

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

### Job array
When you need to run a series of jobs with different arguments, it is pretty useful. Because you do not need a loop any more. You can find more arguments [here](http://docs.adaptivecomputing.com/torque/6-1-1/adminGuide/Content/topics/torque/commands/qsub.htm).
1. You can use `-t` in the shell

   *example.pbs* script 👇
   
   ```bash
   #!/bin/bash
   #PBS -N My_job
   #PBS -l nodes=1:ppn=1
   #PBS -q normal
   
   # run your own program!!!
   python test.py $PBS_ARRAYID
   ```

   run it 👇

   ```bash
   qsub example.pbs -t 1-666
   ```

2. Another way is writing `-t` in the script

   *example.pbs* script 👇
   
   ```bash
   #!/bin/bash
   #PBS -N My_job
   #PBS -l nodes=1:ppn=1
   #PBS -q normal
   #PBS -t 1-666%5
   
   # run your own program!!!
   python test.py $PBS_ARRAYID
   ```

   run it 👇

   ```bash
   qsub example.pbs
   ```
   The optional `%5` in the `-t` parameter specifies a maximum of 5 jobs to be allowed running simultaneously. 

**`PBS_ARRAYID`** here represents the range `1-666`, which means your    job will run as

```bash
python test.py 1
python test.py 2
python test.py 3
...
...
python test.py 666
```

### Openmp job
This is a sample *Fortran90* program using *openmp* to parallelize a *do* loop.

```fortran
program testopenmp
use omp_lib
implicit none

integer(4)::num_threads
integer(4)::thread
integer(4)::i

num_threads=omp_get_max_threads()
write(*,*) 'number of threads:',num_threads

!$omp parallel do schedule(static) default(private)
do i=1,16
  thread=omp_get_thread_num()
  write(*,*) 'loop',i,'is processed by thread',thread
enddo
!$omp end parallel do

endprogram testopenmp
```

Use *Intel compiler* to compile.

```bash
module load compiler/intel-2018
ifort testopenmp.f90 -fopenmp
```

This sample job submission script is applying one node.
The number of threads is set to 8.

```bash
#!/bin/sh
#PBS -N testopenmp
#PBS -l nodes=1:ppn=8
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR

### Set environment###
echo "###############################################"
echo "JOBID: " ${PBS_JOBID}
echo "JOBNAME: " ${PBS_JOBNAME}
module load compiler/intel-2018 && echo $_ "LOADED"
export OMP_NUM_THREADS=8

### RUN ###
echo "###############################################"
./a.out > log

```

The result shows that the *do* loop is been parallelized by 8 threads.

```bash
 number of threads:           8
 loop           1 is processed by thread           0
 loop           3 is processed by thread           1
 loop           5 is processed by thread           2
 loop           7 is processed by thread           3
 loop           2 is processed by thread           0
 loop           9 is processed by thread           4
 loop           4 is processed by thread           1
 loop           6 is processed by thread           2
 loop           8 is processed by thread           3
 loop          11 is processed by thread           5
 loop          13 is processed by thread           6
 loop          10 is processed by thread           4
 loop          12 is processed by thread           5
 loop          15 is processed by thread           7
 loop          14 is processed by thread           6
 loop          16 is processed by thread           7
```

### MPI job
This sample shows a *MPI* parallel program in *Fortran90*.

```fortran
program testmpi
use mpi
implicit none

integer(4)::rank,nrank
integer(4)::ierr
character(len=MPI_MAX_PROCESSOR_NAME)::nodename
integer(4)::namelen

call mpi_init(ierr)
call mpi_comm_rank(MPI_COMM_WORLD,rank,ierr)
call mpi_comm_size(MPI_COMM_WORLD,nrank,ierr)
call mpi_get_processor_name(nodename,namelen,ierr)

write(*,'(a6,i4,a18,a6)') 'rank',rank,'is run on node',trim(nodename)

call mpi_finalize(ierr)

endprogram testmpi
```

Use *Intel compiler* and *IntelMPI* to compile. 

```bash
module load compiler/intel-2018
module load mpi/intel-2018
mpif90 testmpi.f90
```

This sample script is applying 4 nodes and setting 2 processes per node.

```bash
#!/bin/sh
#PBS -N testmpi
#PBS -l nodes=4:ppn=2
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR

### Set environment###
echo "###############################################"
echo "JOBID: " ${PBS_JOBID}
echo "JOBNAME: " ${PBS_JOBNAME}
module load compiler/intel-2018 && echo $_ "LOADED"
module load mpi/intel-2018 && echo $_ "LOADED"

### RUN ###
echo "###############################################"
mpirun -np ${PBS_NP} ./a.out > log

```

The result shows that *gr25*-*gr28* is used to finish the job, with 2 processes per node.

```bash
  rank   2    is run on node  gr27
  rank   6    is run on node  gr25
  rank   3    is run on node  gr27
  rank   7    is run on node  gr25
  rank   0    is run on node  gr28
  rank   4    is run on node  gr26
  rank   1    is run on node  gr28
  rank   5    is run on node  gr26
```

### Hybrid job
This sample *Fortran90* program use both *MPI* and *openmp*.

```fortran
program checkhybrid
use omp_lib
use mpi
implicit none

integer(4)::rank,nrank
integer(4)::ierr
integer(4)::NUM_THREADS
character(len=MPI_MAX_PROCESSOR_NAME)::nodename
integer(4)::namelen

call mpi_init(ierr)
call mpi_comm_rank(MPI_COMM_WORLD,rank,ierr)
call mpi_comm_size(MPI_COMM_WORLD,nrank,ierr)
call mpi_get_processor_name(nodename,namelen,ierr)
NUM_THREADS=omp_get_max_threads()

write(*,'(a6,i4,a6,i4)') 'rank',rank,trim(nodename),NUM_THREADS

call mpi_finalize(ierr)

endprogram checkhybrid
```

Use *Intel compiler* and *IntelMPI* to compile the code. 

```bash
module load compiler/intel-2018
module load mpi/intel-2018
mpif90 testhybrid.f90 -fopenmp
```

The first script is applying 4 nodes and setting 4 processes per node.
The number of openmp thread is not set in the environment.

```bash
#!/bin/sh
#PBS -N testhybrid
#PBS -l nodes=4:ppn=4
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR

### Set environment###
echo "###############################################"
echo "JOBID: " ${PBS_JOBID}
echo "JOBNAME: " ${PBS_JOBNAME}
module load compiler/intel-2018 && echo $_ "LOADED"
module load mpi/intel-2018 && echo $_ "LOADED"

### RUN ###
echo "###############################################"
mpirun -np ${PBS_NP} ./a.out > log.n4ppn4ompnull

```

The result shows that 4 processes per node and 4 nodes in total is used to complete the job.
Each process has 18 threads automatically, which equals the number of cores per node divided by the number of processes per node, i.e. 18=72/4.

```bash
  rank   0  gr28  18
  rank  12  gr25  18
  rank   4  gr27  18
  rank   8  gr26  18
  rank   1  gr28  18
  rank  13  gr25  18
  rank   5  gr27  18
  rank   9  gr26  18
  rank   2  gr28  18
  rank  14  gr25  18
  rank   6  gr27  18
  rank  10  gr26  18
  rank   3  gr28  18
  rank  15  gr25  18
  rank   7  gr27  18
  rank  11  gr26  18
````


The second script is similar to the first one but setting 2 processes per node.

```bash
#!/bin/sh
#PBS -N testhybrid
#PBS -l nodes=4:ppn=2
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR

### Set environment###
echo "###############################################"
echo "JOBID: " ${PBS_JOBID}
echo "JOBNAME: " ${PBS_JOBNAME}
module load compiler/intel-2018 && echo $_ "LOADED"
module load mpi/intel-2018 && echo $_ "LOADED"

### RUN ###
echo "###############################################"
mpirun -np ${PBS_NP} ./a.out > log.n4ppn2ompnull

```

One can find that each process has more number of threads.

```bash
  rank   0  gr28  36
  rank   2  gr27  36
  rank   4  gr26  36
  rank   1  gr28  36
  rank   3  gr27  36
  rank   5  gr26  36
  rank   6  gr25  36
  rank   7  gr25  36
```

The third sample is specifying the number of `openmp` threads by `OMP_NUM_THREADS` environmental variable.

```bash
#!/bin/sh
#PBS -N testhybrid
#PBS -l nodes=4:ppn=4
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR

### Set environment###
echo "###############################################"
echo "JOBID: " ${PBS_JOBID}
echo "JOBNAME: " ${PBS_JOBNAME}
module load compiler/intel-2018 && echo $_ "LOADED"
module load mpi/intel-2018 && echo $_ "LOADED"
export OMP_NUM_THREADS=12

### RUN ###
echo "###############################################"
mpirun -np ${PBS_NP} ./a.out > log.n4ppn4omp12

```

The result is same as the first one expect that the number of threads per process is limited.

```bash
  rank   4  gr27  12
  rank   8  gr26  12
  rank  12  gr25  12
  rank   0  gr28  12
  rank   5  gr27  12
  rank   9  gr26  12
  rank  13  gr25  12
  rank   1  gr28  12
  rank   6  gr27  12
  rank  10  gr26  12
  rank  14  gr25  12
  rank   2  gr28  12
  rank   7  gr27  12
  rank  11  gr26  12
  rank  15  gr25  12
  rank   3  gr28  12
```

### GPU job
This sample use `nvcc` to compile a example *cuda* code

```cuda
/* ---------------------------------------------------
   My Hello world for CUDA programming
   --------------------------------------------------- */

#include <stdio.h>        // C programming header file
#include <unistd.h>       // C programming header file
                          // cude.h is automatically included by nvcc...

/* ------------------------------------
   Your first kernel (= GPU function)
   ------------------------------------ */
__global__ void hello( )
{
   printf("Hello World From GPU!\n");
}

int main()
{
   /* ------------------------------------
      Call the hello( ) kernel function
      ------------------------------------ */
   hello<<< 1, 4 >>>( );

   printf("I am the CPU: Hello World ! \n");

   sleep(1);   // Necessary to give time to let GPU threads run !!!

   return 0;
}
```

```bash
nvcc hello.cu -o hello
```

A simply job submission script is as follow.

```bash
#!/bin/sh
#PBS -N testgpu
#PBS -q gpu
#PBS -l nodes=1:ppn=72
#PBS -W x=GRES:gpu at 1
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR

### Set environment###
echo "###############################################"
echo "JOBID: " ${PBS_JOBID}
echo "JOBNAME: " ${PBS_JOBNAME}

### RUN ###
echo "###############################################"
./hello > log
```

You will see the following output

```
I am the CPU: Hello World ! 
Hello World From GPU!
Hello World From GPU!
Hello World From GPU!
Hello World From GPU!
```


## PBS commands

### submit a new job

One can submit a job via the `qsub` command.

`qsub` `[-a date_time]` `[-c interval]` `[-C directive_prefix]` `[-e path]`
`[-I]` `[-j join]` `[-k keep]` `[-l resource_list]` `[-m mail_options]`
`[-M user_list]` `[-N name]` `[-o path]` `[-p priority]` `[-q destination]`
`[-r c]` `[-S path_list]` `[-u user_list]` `[-v variable_list]` `[-V]`
`[-W additional_attributes]` `[-z]` `[script]`

We recommend submit jobs via the job scripts 👉 `qsub JOB_SCRIPT`.
For job script sample, check the [samples](https://gravity-doc.github.io/Basic/Job.html#Submission).

### check the job status

`qstat` can show the status of all the jobs in **S (status)** column. 

```bash
[testuser@GRAVITY:~]:qstat
Job ID                    Name             User            Time Use S Queue
------------------------- ---------------- --------------- -------- - -----
1276.login01               athena++         user1             3342:50: R small
1277.login01               athena++         user1                    0 Q small
1352.login01               run_velprof      user3           1257:36: R fat
```

Use `qstat -u <username>` to show the jobs submitted by one user.

### cancel job

| Command                 | Description                                                              |
| ----------------------- | ------------------------------------------------------------------------ |
| `qdel [-W time] JOB_ID` | `-W time` can specify the delay of the job cancel.  The unit is seconds. |
| `qselect -u $USER       | xargs qdel`                                                              | Delete all of your jobs              |
| `qselect -u $USER -s Q  | xargs qdel`                                                              | Delete all of your **Queueing** jobs |
| `qselect -u $USER -s R  | xargs qdel`                                                              | Delete all of your **Running** jobs  |



### check pending status

`checkjob JOB_ID` can provide the information of a pending job.

## References

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

- [qsub doc](http://docs.adaptivecomputing.com/torque/4-1-3/help.htm#topics/commands/qsub.htm)
- `man qsub`
- `man pbs_resources`

# Slurm

😜 Coming soon... ... ...
