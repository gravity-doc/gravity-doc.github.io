---
sort: 2
---

# MPI job

This sample shows a *mpi* parallel program in *Fortran90*.
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

Use *intel compiler* and *intelMPI* to compile. 
```bash
module load compiler/intel-2018
module load mpi/intel-2018
mpif90 testmpi.f90 -fopenmp
```

This sample script is applying 4 nodes and 2 processor per node.
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

The result shows that gr25-gr28 is used to finish the job, with 2 process per node.
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