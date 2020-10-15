---
sort: 8
---

## FAQ

 ### 日志残留问题
  
  问题描述:当用户提交两个节点以上的任务时，就会出现日志残留问题。
  ```bash
  [inspur@login02 gr01]$ cat inspur-test-3.e2619
    cgdelete: cannot remove group 'gr28.2619.login01': No such file or directory
  ```
  这个问题并不会影响可以使用，也不会影响作业的运行。该问题我们正在寻找出现原因，争取尽快解决。
  
 ### compiler/intel-2020 module无法使用的问题

  使用module load compiler/intel-2020无法生效，可能是因为一些参数没有配置，目前还没有找到是因为什么参数没有配置。
  
  大家提交任务如果需要使用intel2020的话，可以直接写source路径。
  ```bash
  
  ```
  

