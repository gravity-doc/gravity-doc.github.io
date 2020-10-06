---
sort: 1
---

# Serial job

This sample use *gcc* to compile a *Fortran90* Hello World.
```fortran
program testseries
implicit none

write(*,*) 'Hello World!'

endprogram testseries
```
```bash
module load gcc
gfortran testseries.f90
```

A simply job submission script is as follow.
```bash
#!/bin/sh
#PBS -N testseries
#PBS -l nodes=1:ppn=1
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIR

### Set environment###
echo "###############################################"
echo "JOBID: " ${PBS_JOBID}
echo "JOBNAME: " ${PBS_JOBNAME}
module load gcc && echo $_ "LOADED"

### RUN ###
echo "###############################################"
./a.out > log
```


