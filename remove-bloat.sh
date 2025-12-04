#!/bin/env sh

# disable systemd timesync
sudo systemctl disable --now systemd-timesyncd.service
# remove fwupd
sudo apt autoremove fwupd fwupd-signed
# remove snap
sudo apt autoremove snapd
# remove polkit
sudo apt autoremove polkitd
