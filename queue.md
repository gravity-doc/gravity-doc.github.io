---
sort: 5
---

# Job Queues

`qstat -q ` shows a summary of available queues.

`qstat -f -Q` shows the detailed queue configurations, which are also listed below:

| Queue Name | Max number of nodes | Max walltime | Max number of jobs| Note|
|----|----|----|----|----|
| normal | 16 | 48 hrs | not limited | general purpose parallel jobs|
|small| gr33-gr36 | not limited | not limited | |

Special purpose queues:

| Queue Name | Max number of nodes | Max walltime | Max number of jobs| Note|
|----|----|----|----|----|
| fat | only fat node | 72 hrs | not limited | large shared-memory jobs （mem >360GB, otherwise use normal) |
|gpu| only gr36 node | not limited | not limited | gpu jobs|


