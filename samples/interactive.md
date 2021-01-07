---
sort: 6
---

# Interactive jobs

To request resources for doing something interactively, you can submit an interactive job.

For example:
```
qsub -l nodes=1:ppn=4,mem=8gb,walltime=12:00:00 -q interactive -I
```

You will be logged onto the assigned node once the above job get running, and you can start to run your actual computation interactively.

Reference: https://www.msi.umn.edu/content/interactive-queue-use-qsub
