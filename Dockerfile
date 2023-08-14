FROM docker.io/caddy:2.7.2-builder-alpine as builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/rfc2136@latest

FROM docker.io/caddy:2.7.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
