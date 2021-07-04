from golang:1.16

COPY *.sh .
COPY Caddyfile .
COPY ftw.yaml .

RUN sudo apt install libpcre++-dev
RUN git clone https://github.com/jptosso/coraza-waf
RUN cd coraza-waf && sudo make deps

RUN go install github.com/fzipi/go-ftw@latest

RUN ./crs-setup.sh
RUN CGO_ENABLED=1 xcaddy build --with github.com/jptosso/coraza-caddy/
RUN ./caddy run --adapter caddyfile --config Caddyfile

ENTRYPOINT ["go-ftw", "--config ftw.yaml"]