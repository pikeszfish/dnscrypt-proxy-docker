## dnscrypt-proxy-docker

## dnscrypt-proxy-config.sh
Thanks to [CNMan/dnscrypt-proxy-config](https://github.com/CNMan/dnscrypt-proxy-config)

Remove `-N` as `wget` in `golang:1.10-alpine` does not have it.

### Build
```
docker build -t dnscrypt-proxy-docker:0.1.0 .
```

### Run
```
docker run -d --name dnscrypt-proxy-docker --restart always -p 127.0.0.1:53:53/tcp -p 127.0.0.1:53:53/udp dnscrypt-proxy-docker:0.1.0
```
Then modify your system DNS to 127.0.0.1

### Logs
```
docker exec -it dnscrypt-proxy-docker tail -f /opt/dnscrypt-proxy.log
docker exec -it dnscrypt-proxy-docker tail -f /opt/dnscrypt-query.log
docker exec -it dnscrypt-proxy-docker tail -f /opt/dnscrypt-nxdomain.log
```
