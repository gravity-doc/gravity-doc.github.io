---
sort: 4
title: statistics website
---

# status/statistics website
You can check the status of jobs and queues through the [ClusterEngine](https://stat.gravity.sjtu.edu.cn) webpage. For security reasons, currently the webpage is only accessible through a tunnel. First create a tunnel using:

```
ssh -L 8443:localhost:8443 user@login01.gravity.sjtu.edu.cn -fN
```

Replace `user ` with your username on gravity in the above command. Once this is done, open your browser and visit https://localhost:8443 .