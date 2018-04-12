FROM golang:1.10-alpine as builder

# Build dnscrypt-proxy
RUN apk add --update git
RUN go get -v golang.org/x/net/http2
RUN go get -v -d github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -a -v github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy

COPY dnscrypt-proxy-config.sh /
RUN /dnscrypt-proxy-config.sh

#########
FROM alpine
RUN apk add --update ca-certificates
COPY --from=builder /go/dnscrypt-proxy /opt/

RUN mkdir -p /opt
# Copy config file
COPY --from=builder /go/forwarding-rules.txt /opt
COPY --from=builder /go/ip-blacklist.txt /opt
COPY --from=builder /go/blacklist.txt /opt
COPY --from=builder /go/cloaking-rules.txt /opt

# Config it yourself
COPY ./dnscrypt-proxy.toml /opt/

# Just run it
CMD /opt/dnscrypt-proxy
