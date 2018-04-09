## dnscrypt-proxy-docker

## dnscrypt-proxy-config.sh
Comes from [CNMan/dnscrypt-proxy-config](https://github.com/CNMan/dnscrypt-proxy-config)

### Build
```
docker build -t dnscrypt-proxy-docker:0.1.0 .
```

### Run
```
docker run -n dnscrypt-proxy-docker --restart on-failure -d -p 0.0.0.0:53:53/tcp -p 0.0.0.0:53:53/udp dnscrypt-proxy-docker:0.1.0
```