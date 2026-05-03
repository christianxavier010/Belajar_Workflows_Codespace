#!/usr/bin/env bash

sudo tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &

sleep 5

sudo tailscale up \
  --authkey=${TAILSCALE_AUTHKEY} \
  --hostname=codespace-dev \
  --accept-dns=false \
  --reset

# Jaga process tetap hidup
tail -f /dev/null
