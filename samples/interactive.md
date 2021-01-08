---
sort: 6
---

# Interactive jobs

To request resources for doing something interactively, you can submit an interactive job.

For example:
```
qsub -l nodes=1:ppn=4,mem=8gb,walltime=12:00:00 -q normal -I
```

You will be logged onto the assigned node once the above job get running, and you can start to run your actual computation interactively. 

```warning
- Please use the system responsibly and only start an interactive job when necessary. 

- Do not use more resources than requested, otherwise you might affect other jobs or crash the node.

- CPU time will be charged in the same way as normal jobs. Remember to log out of the computing node to end the interactive job. 

```

Reference: [https://www.msi.umn.edu/content/interactive-queue-use-qsub](https://www.msi.umn.edu/content/interactive-queue-use-qsub)
