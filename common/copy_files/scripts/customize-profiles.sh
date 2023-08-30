#!/usr/bin/env bash
set -x

echo "Modify root profile"
cp /root/.vimrc /root/.vimrc.org
cp /root/.bashrc /root/.bashrc.org
cp /root/.bash_profile /root/.bash_profile.org
cp -f /tmp/copy_files/profiles/root/.bash_profile /root/
cp -f /tmp/copy_files/profiles/root/.vimrc /root/

echo "Modify skel profile"
cp /etc/skel/.vimrc /etc/skel/.vimrc.org
cp /etc/skel/.bashrc /etc/skel/.bashrc.org
cp /etc/skel/.bash_profile /etc/skel/.bash_profile.org
cp -f /tmp/copy_files/profiles/skel/.bash_profile /etc/skel/
cp -f /tmp/copy_files/profiles/skel/.vimrc /etc/skel/