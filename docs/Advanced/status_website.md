---
sort: 4
title: Status/Statistics Website
---

# Status/Statistics Website
You can check the status of jobs and queues through the [~~ClusterEngine~~](https://stat.gravity.sjtu.edu.cn) webpage. For security reasons, currently the webpage is only accessible through a ssh tunnel.

1. Use *ssh tunnel* to connect to the port `8443` of *Gravity login01*

   ```
   ssh -i <your_ssh_key> -CNL 8443:localhost:8443 <username>@login01.gravity.sjtu.edu.cn
   # For example 🌰
   ssh -i ~/.ssh/id_rsa_Gravity -CNL 8443:localhost:8443 lalala@login01.gravity.sjtu.edu.cn
   ```

2. Open browser, visit

   ```http
   https://localhost:8443
   ```

3. Use your *username* **+** *password* of Gravity to log in
