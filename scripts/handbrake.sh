#!/bin/sh
if [[ $EUID -ne 0 ]]; then #EUID(사용자계정번호)가 0 -> 루트계정/999까지는 서버가 쓰는 번호/-ne: 같지 않으면
	echo "This script must be run as Root" 1>&2
	exit 1
fi
yum update
yum groupinstall "Development Tools" "Additional Development"
yum install fribidi-devel git jansson-devel libogg-devel libsamplerate-devel libtheora-devel libvorbis-devel opus-devel
yum install libass-devel yasm
yum repo-pkgs zmrepo remove
yum remove zmrepo
yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
yum install lame-devel x264-devel
if [ ! -d "/home/$USER/app" ]; then
	mkdir /home/$USER/app
fi
cd /home/$USER/app
git clone https://github.com/HandBrake/HandBrake.git
cd HandBrake
git tag --list | grep ^1\.1\.
git checkout refs/tags/$(git tag -l | grep -E '^1\.1\.[0-9]+$' | tail -n 1)
./configure --launch-jobs=16 --launch
make --directory=build install
rm -rf build

