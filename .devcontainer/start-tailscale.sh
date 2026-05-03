#!/usr/bin/env bash

echo "Starting tailscaled in userspace mode..."

sudo nohup tailscaled --tun=userspace-networking --socks5-server=localhost:1055 > /tmp/tailscaled.log 2>&1 &

sleep 5

echo "Bringing Tailscale up..."

sudo tailscale up \
  --authkey=${TAILSCALE_AUTHKEY} \
  --hostname=codespace-dev \
  --accept-dns=false \
  --reset

echo "Tailscale connected."