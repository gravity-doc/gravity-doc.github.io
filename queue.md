---
sort: 5
---

# Queue Policy

`qstat -f -Q` shows the currently available queues and the limitations.

| Queue Name | Max number of nodes | Max walltime | Max number of jobs|
|----|----|----|----|
| normal | 20 | 72 hrs | not limited |
|fat| only fat node | 30 days | not limited |
|slim| 1 | 7 days | not limited |
|----|----|----|----|
|all| not limited | 12 hrs | 1 |
|small| 4 | 10 days | not limited |
|gpu| gr36 | not limited | not limited |