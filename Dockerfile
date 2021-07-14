FROM jptosso/coraza-waf:latest


RUN go install github.com/fzipi/go-ftw@latest
COPY install-crs.sh .
COPY Caddyfile .
RUN ./install-crs.sh
COPY entrypoint.sh /bin/
COPY ftw.yml .
RUN touch /tmp/audit.log

ENTRYPOINT ["/bin/entrypoint.sh"]