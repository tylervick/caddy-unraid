FROM docker.io/caddy:2.8.4-builder-alpine as builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/mholt/caddy-dynamicdns@latest \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2@latest \
    --with github.com/abiosoft/caddy-json-schema@latest \
    --with github.com/caddy-dns/rfc2136@master \
    --with github.com/greenpau/caddy-security@latest

FROM docker.io/caddy:2.8.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
