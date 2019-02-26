#!/bin/sh
#이 스크립트는 CentOS7.6에서 소프트웨어를 설치한다.
#root로 한 번 실행 후 다시 user로 실행이 필요하다.
if [[ $EUID -e 0 ]]; then
./root/nvidia.sh
./root/utility.sh
./root/code.sh
./root/djv.sh
./root/mpv.sh
./root/rmhotcorner.sh
./root/devtools.sh
./root/handbrake.sh
./root/openimageio.sh
./root/pip_install.sh
else
#install $USER
./user/trans.sh
./user/pip.sh
./user/ffmpeg.sh
./user/ocio_config.sh
./user/gaffer.sh
./user/blender.sh

# gcc6.x를 이용해서 빌드한다.
scl enable devtoolset-6 ./cmake.sh
scl enable devtoolset-6 ./openexr.sh
scl enable devtoolset-6 ./opencolorio.sh
scl enable devtoolset-6 ./alembic.sh
./rmdeep.sh
