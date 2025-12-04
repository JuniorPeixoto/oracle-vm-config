#!/bin/env sh
sudo tee /etc/default/grub.d/50-cloudimg-settings.cfg <<'EOF'
GRUB_TIMEOUT=5
GRUB_TIMEOUT_STYLE=menu
GRUB_RECORDFAIL_TIMEOUT=5

# console serial do GRUB
GRUB_TERMINAL="serial console"
GRUB_SERIAL_COMMAND="serial --speed=115200"

# kernel ainda via serial + tty1
GRUB_CMDLINE_LINUX_DEFAULT="console=ttyS0,115200n8 console=tty1 nvme.shutdown_timeout=10 libiscsi.debug_libiscsi_eh=1 crash_kexec_post_notifiers iscsi_auto_skip_initramfs_networking"
EOF

sudo update-grub
