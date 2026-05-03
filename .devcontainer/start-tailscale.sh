#!/usr/bin/env bash

echo "Starting tailscaled (userspace)..."

nohup tailscaled \
  --tun=userspace-networking \
  --state=/tmp/tailscale.state \
  --socket=/tmp/tailscaled.sock > /tmp/tailscaled.log 2>&1 &

sleep 4

echo "Running tailscale up..."

tailscale \
  --socket=/tmp/tailscaled.sock \
  up --authkey=${TAILSCALE_AUTHKEY} \
  --hostname=codespace-dev \
  --accept-dns=false \
  --reset

tailscale --socket=/tmp/tailscaled.sock status
