---
sort: 5
---

# Queue Policy

`qstat -f -Q` shows the currently available queues and the limitations.

| Queue Name | Max number of nodes | Max walltime | Max number of jobs|
|----|----|----|----|
| normal | 20 | 72 hrs | not limited |
| fat | only fat node | not limited | not limited |
| slim | 1 | 7 days | not limited |
| all | not limited | 12 hrs | 1 |

| Queue Name | Max number of nodes | Max walltime | Max number of jobs|
|----|----|----|----|
|small| gr33-gr36 | not limited | not limited |
|gpu| only gr36 node | not limited | not limited |