## dnscrypt-proxy-docker

## dnscrypt-proxy-config.sh
Comes from [CNMan/dnscrypt-proxy-config](https://github.com/CNMan/dnscrypt-proxy-config)
Remove `-N` as wget int golang:1.10-alpine does not have it.

### Build
```
docker build -t dnscrypt-proxy-docker:0.1.0 .
```

### Run
```
docker run --name dnscrypt-proxy-docker --restart on-failure -d -p 127.0.0.1:53:53/tcp -p 127.0.0.1:53:53/udp dnscrypt-proxy-docker:0.1.0
```

### Logs
```
docker exec -it dnscrypt-proxy-docker tail -f /opt/dnscrypt-proxy.log
docker exec -it dnscrypt-proxy-docker tail -f /opt/dnscrypt-query.log
docker exec -it dnscrypt-proxy-docker tail -f /opt/dnscrypt-nxdomain.log
```
