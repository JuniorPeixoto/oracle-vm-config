#!/bin/env sh

# define the kernel version
kernel_version=6.17.10

# install necessary packages
sudo apt install -y make git gcc flex bison bc libglew-dev htop neovim ccache

# config ccache
sudo ln -sf /usr/bin/ccache /usr/local/bin/gcc
sudo ln -sf /usr/bin/ccache /usr/local/bin/g++

# download and extract the kernel source code
cd "$HOME" || exit
wget "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${kernel_version}.tar.xz" \
  && tar -xf "linux-${kernel_version}.tar.xz"

# enter in the source kernel directory
cd "$HOME/linux-${kernel_version}" || exit

[ ! -e "$HOME/git/oracle-vm-scripts/kernel/config" ] \
  && cp "$HOME/git/oracle-vm-scripts/kernel/config" "$HOME/linux-*/.config"
