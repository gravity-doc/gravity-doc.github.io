---
sort: 5
---

# GPU job

This sample use *nvcc* to compile a example cuda code
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
