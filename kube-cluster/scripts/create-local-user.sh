#!/usr/bin/env bash
set -x

sudo useradd -G sudo -p '$6$ePnvbSRy74TTigJJ$RGzSBad1Ii6vjHe3bYz0PaL.TRpvIYykopALUaHiucZq5eRH2UPXgIXA9GPMWhUPoJu/nAdo3GZMgjI7/bVIn/' -m -s /bin/bash pkaila
sudo sh -c "echo 'pkaila ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/pkaila"