---
sort: 1
---

# X11 Tunnel
```tip
Running graphical software on Gravity with X11 tunneling
Actually, sometimes using **[VNC](https://gravity-doc.github.io/Advanced/SSH-tunnel.html#VNC)** is better 😜
```

One way to run graphical software on Gravity is to use [X11 tunneling](https://en.wikipedia.org/wiki/X_Window_System).
It allows you to run a **graphical application** on the *login* or *computing node*, and to control it from your local computer. For example, you can **view images** in the *Gravity* using

> - `eog`
>
> - `display`

## Windows

For Windows users, we recommend you to use **[MobaXTerm](https://mobaxterm.mobatek.net/download.html)**. It comes with built-in X11 support, so you don't need to do any extra steps. Just [login Gravity](https://gravity-doc.github.io/Basic/Login.html). Once you are connected, you can connect to an interactive compute node using the -X switch, for example 🌰

```bash
qsub -I -X -l nodes=1:ppn=72,mem=1gb,walltime=12:00:00 -q normal
```

Then, you can run your graphical application from the compute node. 🎉

## Mac

Mac users would need to install the program called [XQuartz](https://www.xquartz.org). After installation, double-click on the XQuartz icon to start it (it usually installs into `Applications` -> `Utilities`). Then, in a terminal window

```bash
ssh -Y -i <your_ssh_key> <username>@gravity.sjtu.edu.cn
```

Once you are logged in, you can connect to an interactive compute node using the -X switch, for example

```bash
qsub -I -X -l nodes=1:ppn=36,mem=100gb,walltime=12:00:00 -q normal
```

Then, you can run your graphical application from the compute node.

## Linux
Just use `ssh` to log in!
```bash
ssh -X -i <your_ssh_key> <username>@gravity.sjtu.edu.cn
```

Once you are connected, you can connect to an interactive compute node using the -X switch, for example

```bash
qsub -I -X -l nodes=1:ppn=36,mem=100gb,walltime=12:00:00 -q normal
```

Then, you can run your graphical application from the computing node.
