---
sort: 8
---

### FAQ

## 日志残留问题
  
  问题描述:当用户提交两个节点以上的任务时，就会出现日志残留问题。
  ```bash
  [inspur@login02 gr01]$ cat inspur-test-3.e2619
    cgdelete: cannot remove group 'gr28.2619.login01': No such file or directory
  ```
  这个问题并不会影响可以使用，也不会影响作业的运行。该问题我们正在寻找出现原因，争取尽快解决。
