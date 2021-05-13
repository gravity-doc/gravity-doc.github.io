---
sort: 5
---

# Job Queues

`qstat -f -Q` shows the currently available queues and the limitations.

| Queue Name | Max number of nodes | Max walltime | Max number of jobs| Note|
|----|----|----|----|----|
| normal | 20 | 72 hrs | not limited | general purpose parallel jobs|
|small| gr33-gr36 | not limited | not limited | |
| all | not limited | 12 hrs | 1 | for jobs exceeding 20 nodes|


Special purpose queues:
| Queue Name | Max number of nodes | Max walltime | Max number of jobs| Note|
|----|----|----|----|----|
| fat | only fat node | not limited | not limited | large shared-memory jobs|
|gpu| only gr36 node | not limited | not limited | gpu jobs|


