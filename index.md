## 欢迎进入上海交通大学天文系高性能计算中心

You can use the [editor on GitHub](https://github.com/SJTU-GRAVITY-HPC/SJTU-GRAVITY-HPC.github.io/edit/master/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### 集群队列信息

```集群队列信息
A job scheduling system(pbs/torque),which configured with three queues: 
 1. normal(gr01-gr32)[default queue]
 2. small(gr33-gr36)
 3. fat(fat01)
```
### 高性能集群作业提交脚本

```作业提交脚本
the sample submit script for torque:
  #PBS -N gr01-linpack
  #PBS -l nodes=gr01:ppn=72
  #PBS -q normal
  #PBS -V
  #PBS -S /bin/bash
  #PBS -W group_list=project2
  ### Set intel environment###
  module load mpi/intel-2018 
  cd $PBS_O_WORKDIR
  NP=`cat $PBS_NODEFILE | wc -l`
  cat $PBS_NODEFILE > /tmp/nodefile.$$
  mpirun -machinefile /tmp/nodefile.$$ -n $NP  EXEC
  rm -rf /tmp/nodefile.$$
  rm -rf /tmp/nodes.$$
notes: the group_list argument is your project name
````
### 高性能集群module的使用
```module使用
module can be used to manage the software in this cluster. Usage as follow:
 1. module avail  # list all software 
 2. module load modulefiles   # load moduelfiles for special software
 3. module unload modulefiles # unload modulefiles
 4. module list   # list modulefiles loaded now
 5. module switch modulefiles1 modulefiles2        # switch from modulefiles1 to modulefiles2
```
如想要了解更详细信息请点击[github](https://github.com/SJTU-GRAVITY-HPC/SJTU-GRAVITY-HPC.github.io),查看详细的用户手册.


### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/SJTU-GRAVITY-HPC/SJTU-GRAVITY-HPC.github.io/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
