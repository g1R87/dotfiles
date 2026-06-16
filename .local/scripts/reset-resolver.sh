#!/bin/bash

echo "[*] Resetting /etc/resolv.conf..."
sudo truncate -s 0 /etc/resolv.conf
echo "Done."
