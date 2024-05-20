profile_standard() {
	title="Standard"
	desc="ISO for reseting VMware ESXi password easily"
	profile_base
	profile_abbrev="std"
	image_ext="iso"
	arch="x86 x86_64"
	output_format="iso"
	kernel_addons="xtables-addons zfs"
	boot_addons="amd-ucode intel-ucode"
	apks="$apks iw wpa_supplicant"
	initrd_ucode="/boot/amd-ucode.img /boot/intel-ucode.img"
	apks="$apks
		coreutils ethtool hwids doas
		logrotate lsof lm_sensors lxc lxc-templates nano
		pciutils strace tmux
		usbutils v86d vim xtables-addons curl

		acct arpon arpwatch awall bridge-utils bwm-ng
		ca-certificates conntrack-tools cutter cyrus-sasl dhcp
		dhcpcd dhcrelay dnsmasq fping fprobe htop
		igmpproxy ip6tables iproute2 iproute2-qos
		iptables iputils nftables iw kea ldns-tools links
		ncurses-terminfo net-snmp net-snmp-tools nrpe nsd
		opennhrp pingu ppp quagga
		quagga-nhrp rng-tools sntpc socat ssmtp strongswan
		sysklogd tcpdump tinyproxy unbound
		wireless-tools wpa_supplicant zonenotify

		btrfs-progs cksfv dosfstools cryptsetup
		e2fsprogs e2fsprogs-extra efibootmgr f2fs-tools
		grub-bios grub-efi lvm2 lz4 mdadm mkinitfs mtools nfs-utils
		parted rsync sfdisk syslinux util-linux xfsprogs zstd zfs
		"
	local _k _a
	for _k in $kernel_flavors; do
		apks="$apks linux-$_k"
		for _a in $kernel_addons; do
			apks="$apks $_a-$_k"
		done
	done
	apks="$apks linux-firmware linux-firmware-none"
	apkovl="genapkovl-standard.sh"
}
