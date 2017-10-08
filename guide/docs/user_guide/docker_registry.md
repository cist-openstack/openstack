# Docker at CIST

References:  
https://www.linuxtechi.com/setup-docker-private-registry-centos-7-rhel-7/  
https://docs.docker.com/registry/insecure/#use-self-signed-certificates  

Our Docker registry is located at IP address 10.244.26.13, port 5000 (registry.snapstack.cloud). If you would like to use Docker, please follow the "Client" steps below.

### On the Registry Server  
Here are the steps followed to set up, configure, and start a Docker registry server, as well as tag and upload an image to the server.  

If you are not using SSL, edit /etc/docker/daemon.json:  
`vim /etc/docker/daemon.json`  

```
{
  "insecure-registries" : ["registry.snapstack.cloud:5000"]
}
```

Download the docker "registry" container:  
`docker pull registry`  

Start the container:  
`docker run -dit -p 5000:5000 --name registry registry`  

Pull down a test image:  
`docker pull ansible/centos7-ansible`  

Tag the image:  
`docker tag ansible/centos7-ansible registry.snapstack.cloud:5000/centos7-ansible-cist`  


### On a Client
Follow these instructions to use Docker on CentOS7 / Red Hat 7.  

Update /etc/hosts:  
```
10.244.26.13  registry  registry.snapstack.cloud
```

Edit the /usr/lib/systemd/system/docker.service and add "--insecure-registry registry.snapstack.cloud:5000" to the ExecStart directive:  
```
ExecStart=/usr/bin/dockerd-current \
          --insecure-registry registry.snapstack.cloud:5000
```

Reload the daemon:  
`systemctl daemon-reload`  

Start Docker:  
`sudo start docker`  

Pull the image:  
`docker pull registry.snapstack.cloud:5000/centos7-ansible-cist`  

