---
sort: 5
---

# GPU job

This sample use *nvcc* to compile a example cuda code
```fortran
program testseries
implicit none

write(*,*) 'Hello World!'

endprogram testseries
```
```bash
nvcc 
```

A simply job submission script is as follow.
```bash
#!/bin/sh
#PBS -N testgpu
#PBS -q gpu
#PBS -l nodes=1:ppn=72
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
