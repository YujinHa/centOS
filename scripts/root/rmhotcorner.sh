#!/bin/sh
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as Root" 1>&2
	exit
fi
yum -y install gnome-tweak-tool
yum -y install gnome-shell-extension-no-hot-corner
# $ gnome-tweaks
