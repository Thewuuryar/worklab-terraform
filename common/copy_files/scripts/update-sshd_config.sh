#!/usr/bin/env bash
set -x

rm -rf /etc/ssh/sshd_config.d/
sed -i".bak" "s/\#*\(PermitRootLogin\s*\).*$/\1no/" /etc/ssh/sshd_config
sed -i".bak" "s/\#*\(PasswordAuthentication\s*\).*$/\1no/" /etc/ssh/sshd_config
systemctl restart sshd