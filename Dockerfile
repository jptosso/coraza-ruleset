FROM caddy:2.4.3-builder AS builder

RUN apk add gcc libc-dev bash pcre-dev
RUN go install github.com/fzipi/go-ftw@latest

FROM jptosso/coraza-waf:latest
COPY Caddyfile .
COPY entrypoint.sh /bin/
COPY ftw.yml .
COPY --from=builder /go/bin/go-ftw /bin/go-ftw
COPY crs_setup.conf .
COPY install-crs.sh .
RUN apk add git bash
RUN ./install-crs.sh
RUN touch /tmp/audit.log

ENTRYPOINT ["/bin/entrypoint.sh"]