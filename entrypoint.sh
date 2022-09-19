#!/bin/sh
if [[ ! -z "$SWAP" ]]; then fallocate -l $(($(stat -f -c "(%a*%s/10)*7" .))) _swapfile && mkswap _swapfile && swapon _swapfile && ls -hla; fi; free -m

CODER_PG_CONNECTION_URL="${DATABASE_URL}?sslmode=disable" su-exec coder:coder /opt/coder server
