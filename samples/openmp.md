---
sort: 3
---

# Openmp job

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

Use *intel compiler* to compile.
```bash
module load compiler/intel-2018
ifort testopenmp.f90 -fopenmp
```

This sample job submission script is applying one node.
The number of threads is set to 8.
```bash
#!/bin/sh
#PBS -N testopenmp
#PBS -l nodes=1:ppn=1
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
mpirun -np 1 ./a.out > log

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


