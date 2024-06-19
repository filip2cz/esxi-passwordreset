#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="esxi-passwordreset"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Filip Komárek <https://github.com/filip2cz/esxi-passwordreset>"
iso_application="Easy reset VMWare ESXi password"
iso_version="v1.0"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlzma,109' -E 'ztailpacking,fragments,dedupe')
bootstrap_tarball_compression=(zstd -c -T0 --long -19)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
