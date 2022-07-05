---
sort: 4
title: Status/Statistics Website
---

# Status/Statistics Website
- check your **cost/Job history** on this website.
- view computing nodes **resource status**

## Web access
[open link here](https://gravity.sjtu.edu.cn/inspur/) → log in → log in again

PS. Maybe you do not have permission to access this webpage, then try to use `SSH Tunnel` as following 👇

## SSH tunnel access
1. Use *ssh tunnel* to connect to the port `8443` of *Gravity login01*

   ```
   ssh -i <your_ssh_key> -CNL 8443:localhost:8443 <username>@login01.gravity.sjtu.edu.cn
   # For example 🌰
   ssh -i ~/.ssh/id_rsa_Gravity -CNL 8443:localhost:8443 lalala@login01.gravity.sjtu.edu.cn
   ```

2. Open your browser (Firefox/Chrome/Edge), visit

   ```http
   http://localhost:8443
   ```

3. Input your *username* **+** *password*
