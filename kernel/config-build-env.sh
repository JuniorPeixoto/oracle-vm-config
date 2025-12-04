#!/bin/env sh

# define the kernel version
set kernel-version 6.17.10

# install necessary packages
sudo apt install make gcc flex bison htop nvim ccache

# config ccache
sudo ln -s /usr/bin/ccache /usr/local/bin/gcc
sudo ln -s /usr/bin/ccache /usr/local/bin/g++

# download and extract the kernel source code
wget "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$(kernel-version).tar.xz" \
  && tar -xf "linux-$(kernel-version).tar.xz"

# enter in the source kernel directory
cd "linux-$(kernel-version)" || exit

[ ! -e "$HOME/git/oracle-vm-scripts/kernel/config" ] \
  && cp "$HOME/git/oracle-vm-scripts/kernel/config" "$HOME/linux-*/.config"
