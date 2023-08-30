#!/usr/bin/env bash
set -x

useradd -G wheel -p '$6$ePnvbSRy74TTigJJ$RGzSBad1Ii6vjHe3bYz0PaL.TRpvIYykopALUaHiucZq5eRH2UPXgIXA9GPMWhUPoJu/nAdo3GZMgjI7/bVIn/' -m -s /bin/bash localuser
sh -c "echo 'localuser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/localuser"
mkdir -p /home/localuser/.ssh
cat /tmp/copy_files/ssh_keys/localuser.pub >> /home/localuser/.ssh/authorized_keys
chown -R localuser:localuser /home/localuser