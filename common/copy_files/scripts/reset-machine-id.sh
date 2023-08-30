#!/usr/bin/env bash
set -x

cat /etc/machine-id /var/lib/dbus/machine-id 
cp /etc/machine-id /tmp/machine-id.bak
rm -f /etc/machine-id
systemd-machine-id-setup
cat /etc/machine-id
cat /tmp/machine-id.bak