#!/bin/bash
/bin/caddy start --adapter caddyfile --config Caddyfile
go-ftw run --config ftw.yml -d coreruleset/tests/regression/tests