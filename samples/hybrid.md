---
sort: 4
---

# Hybrid job

This sample *Fortran90* program use both *MPI* and *openmp*.
```Fortran
program checkhybrid
use omp_lib
use mpi
implicit none

integer(4)::rank,nrank
integer(4)::ierr
integer(4)::NUM_THREADS
real(4),allocatable::ran(:)
integer(4),allocatable::iran(:)
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

Use *intel compiler* and *intelMPI* to compile the code. 
```bash
module load compiler/intel-2018
module load mpi/intel-2018
mpif90 testhybrid.f90 -fopenmp
```

The first script is applying 4 nodes and set 4 processes per node.
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

The third sample is specifying the number of openmp threads by `OMP_NUM_THREADS` environmental variable.
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
