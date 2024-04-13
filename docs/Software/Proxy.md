
## Surf the Internet🏄‍

> [!TIP]
> On [**Gravity Web**](https://jupyter.gravity.sjtu.edu.cn/), you can access the Internet🏄‍ when using **Jupyter/VScode** on **login/computing nodes**   
> We will speed up🚀 your **git** connection automatically
> 

### 1. Spawn a server

open [our website](https://jupyter.gravity.sjtu.edu.cn/) → click *Jupyter* button → *log in* → *start my server*

![start](../images/Basic/jupyterhub-start-server.png)

select a job queue → input resource setting → Start

![spawn](../images/Basic/jupyter_select.png)

### 2. Enjoy

You can use `git/wget/curl etc.` to access the Internet.

For example🌰:

![proxy](../images/Basic/jupyter-proxy.png)

## Speedup Git⚡

> [!TIP]
> When using **terminal**, you can use `pgit` to speed up🚀 your `git` connection
> 

### 1. Why

When we use `git clone`, `git pull` or whatever related to git, somehow, there is a wired phenomenon: The speed of connection is **too slow**, or we **cannot even access** [Github](https://github.com)

Therefore, we provide `pgit` (*proxy git*) to solve this problem🥳   

### 2. Usage

#### pgit

> [!TIP]
> On **login01/login02**, `pgit` **==** `git`😎    
> P.S. `pgit` means **proxy git**
> 

**Common usage:**

| **Git**                  | ⚡                     |
| -------------------- | --------------------- |
| `git pull`           | `pgit pull`           |
| `git push`           | `pgit push`           |
| `git clone <url>`    | `pgit clone <url>`    |
| `git fetch <remote>` | `pgit fetch <remote>` |
| `git remote -v`      | `pgit remote -v`      |
| `git xxxxxxxx`       | `pgit xxxxxxxx`       |

**For example**🌰
let us use `pgit` to clone this repo `https://github.com/Samreay/ChainConsumer.git` 👇

```bash
╭─lalala ~ 
╰─$ pgit clone https://github.com/Samreay/ChainConsumer.git
################## Here we go! ༼ つ ◕_◕ ༽つ ####################
Cloning into 'ChainConsumer'...
remote: Enumerating objects: 2797, done.
remote: Total 2797 (delta 0), reused 0 (delta 0), pack-reused 2797
Receiving objects: 100% (2797/2797), 17.84 MiB | 3.04 MiB/s, done.
Resolving deltas: 100% (1788/1788), done.
```

## HTTP_PROXY

If you want to access the Internet🏄‍ on **computing nodes**, you can set `http_proxy` and `https_proxy` manually

```bash
# set http proxy (if you want to use wget/curl)
export {http,https}_proxy=http://login02:6666
export {HTTP,HTTPS}_PROXY=http://login02:6666

# git setting (if you want to use git)
git config --global http.proxy $http_proxy
git config --global https.proxy $http_proxy
git config --global core.sshCommand 'ssh -o "ProxyCommand=ncat -v --proxy-type socks5 --proxy login02:6666 %h %p"'
```

Let us **check** our connection

```bash
# check curl
curl -v github.com

# check clone repo
git clone https://github.com/Samreay/ChainConsumer.git
```

If you want to **cancel** the proxy, you can use `unset` command

```bash
unset {http,https}_proxy
unset {HTTP,HTTPS}_PROXY
git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset core.sshCommand
```

> [!WARNING]
> **Attention!** There is **NO warranty**! But we will try our best to maintain this service😊
> 
