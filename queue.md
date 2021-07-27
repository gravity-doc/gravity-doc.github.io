---
sort: 5
---

# Job Queues

`qstat -q ` shows a summary of available queues.

`qstat -f -Q` shows the detailed queue configurations, which are also listed below:

| Queue Name | Max number of nodes | Max walltime | Max number of jobs| Note|
|----|----|----|----|----|
| debug | 1 | 3 hrs | not limited | High priority  |
| small | 3 | 72 hrs | not limited | Medium priority |
| normal | 20 | 48 hrs | not limited  | Low priority |


Special purpose queues:

| Queue Name | Max number of nodes | Max walltime | Max number of jobs| Note|
|----|----|----|----|----|
| fat | only fat node | 72 hrs | not limited | large shared-memory jobs （mem >360GB, otherwise use normal) |
|gpu| only gr01, gr02, gr36 node | not limited | not limited | gpu jobs|


