FROM golang:1.10-alpine as builder

# Thanks to [CNMan/dnscrypt-proxy-config](https://github.com/CNMan/dnscrypt-proxy-config)
COPY dnscrypt-proxy-config.sh /
RUN /dnscrypt-proxy-config.sh

# Build dnscrypt-proxy
RUN apk add --update git
RUN go get -v golang.org/x/net/http2
RUN go get -v -d github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -a -v github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy

#########
FROM alpine
RUN apk add --update ca-certificates

RUN mkdir -p /opt
# Copy config file
COPY --from=builder /go/dnscrypt-blacklist-domains.txt /opt
COPY --from=builder /go/dnscrypt-blacklist-ips.txt /opt
COPY --from=builder /go/dnscrypt-cloaking-rules.txt /opt
COPY --from=builder /go/dnscrypt-forwarding-rules.txt /opt
RUN echo '' > /opt/dnscrypt-whitelist.txt

# Config it yourself
COPY ./dnscrypt-proxy.toml /opt/

# Just run it
CMD /opt/dnscrypt-proxy

COPY --from=builder /go/dnscrypt-proxy /opt/
