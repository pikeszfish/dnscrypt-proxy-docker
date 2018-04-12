## dnscrypt-proxy-docker

### Build
```
docker build -t dnscrypt-proxy-docker:0.1.1 .
```

### Run
```
docker run -d --name dnscrypt-proxy-docker --restart always -p 127.0.0.1:53:53/tcp -p 127.0.0.1:53:53/udp dnscrypt-proxy-docker:0.1.1
```
Then modify your system DNS to 127.0.0.1

### Image
If your are not able to build the docker image, use `pikeszfish/dnscrypt-proxy-docker:0.1.1` which I built.

### Logs
```
docker exec -it dnscrypt-proxy-docker tail -f /opt/dnscrypt-proxy.log
docker exec -it dnscrypt-proxy-docker tail -f /opt/query.log
docker exec -it dnscrypt-proxy-docker tail -f /opt/nx.log
docker exec -it dnscrypt-proxy-docker tail -f /opt/blocked.log
docker exec -it dnscrypt-proxy-docker tail -f /opt/ip-blocked.log
```

### Other
As I use multi-stage build in Docker, you need to build it with Docker 17.05 or higher.