#!/bin/sh
# Allocate 70% of free disk space as swap
# %a - Free blocks available to non-superuser
# %s - Block size
# Taken from https://community.fly.io/t/swap-memory/2749/2?u=kot
if [[ ! -z "$SWAP" ]]; then fallocate -l $(($(stat -f -c "(%a*%s/10)*7" .))) _swapfile && mkswap _swapfile && swapon _swapfile && ls -hla; fi; free -m

# Set swappiness to 10
sysctl -w vm.swappiness=10

mkdir /.cache && chown coder:coder /.cache

CODER_PG_CONNECTION_URL="${DATABASE_URL}?sslmode=disable" su-exec coder:coder /opt/coder server
