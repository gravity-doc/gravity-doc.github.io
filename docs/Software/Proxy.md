
## Surf the Internet🏄‍

The login nodes have direct access to the internet, while the computing nodes do not. To access internet on a computing node, you can use one of the two options below. 

### 1. Use our proxy service from a computing node

We have setup a clash proxy on login02 which can be used to relay traffic between computing nodes and the internet. 

The proxy also automatically speeds up slow connections to blocked/throttled websites overseas such as GitHub. 

#### Enable Proxy

1. Run the following commands on a computing node, or within your job script

    ```bash
    source /opt/sharing/proxy.sh
    proxyon
    ```
This will set various environment variables (`HTTP_PROXY/HTTPS_PROXY` etc.) which enable common downloading commands (`wget/curl/git/...`) to use our proxy service.

2. **Check** your connection:

    ```bash
    # check curl
    curl -v github.com

    # check clone repo
    git clone https://github.com/Samreay/ChainConsumer.git
    ```

> [!TIP]
> - If you need to download **a large amount of data (> 100GB)** *from overseas*, you can [contact admin](?id=contact) to **speed up**⚡ your connection.
    

#### Disable Proxy

  Run the following command to disable the proxy when you no longer need it:

    ```bash
    proxyoff
    ```

### 2. Access computing nodes through Jupyter

The proxy service is automatically enabled for servers spawned on our JupyterHub.

1. Open [our website](https://jupyter.gravity.sjtu.edu.cn/).
2. Click the *Jupyter* button.
3. Log in and click *Start my server*.

    ![start](../images/Basic/jupyterhub-start-server.png)

4. Select a job queue, input resource settings, and click *Start*.

    ![spawn](../images/Basic/jupyter_select.png)

   This will connect you to a computing node with the requested resources.

5. Open a terminal or notebook in the allocated server.

   Within the Jupyter server, open a terminal or a python notebook or VScode. You will be able to access internet from there using `git`, `wget`, `curl`, etc.

   For example🌰:
    
    ```bash
    # check clone repo
    git clone https://github.com/Samreay/ChainConsumer.git
    ```
    
    ![proxy](../images/Basic/jupyter-proxy.png)
