---
sort: 4
---

# File Transfer

It is a common task to transfer files between different servers or your own desktop.
For transmission of large files, command lines like `scp` or `rsync` are usually recommended.
When one is making plots or editing codes, it might be more convenient to use 
techniques with graphical user interface support.


## scp and rsync

Check the manual of scp and rsync.
`rsync` might be favored for its versatility. 

## SFTP

Gravity provides file access via SFTP.
One can use any file manager or FTP client that supports SFTP.

For example, one can open "dolphin" (file manager) on Linux and enter the following path in the location bar
```
sftp://username@gravity.sjtu.edu.cn/home/username
# replace `username` with your own user name
```
The system will mount it as a remote directory.
One can use this directory just as local directories.

If you are too lazy to enter password at every mounting, you can copy his SSH key to the server
```
ssh-copy-id username@gravity.sjtu.edu.cn
```


## SSHFS

Another popular way to mount a remote directory is to use SSHFS.
One can create a directory in his computer, e.g.,
```
mkdir ~/mnt/gravity
```
and mount the server as following,
```
sshfs username@gravity.sjtu.edu.cn/home/username ~/mnt/gravity -o auto_cache,reconnect,follow_symlinks -o Compression=no -o Ciphers=aes128-ctr
```
One may change these options for his own purpose.

It seems SFTP has better performance than SSHFS.
