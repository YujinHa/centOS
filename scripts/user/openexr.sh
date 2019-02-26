#!/bin/sh
if [ ! -d "/home/$USER/app" ]; then
	mkdir /home/$USER/app
fi
cd /home/$USER/app
wget https://github.com/openexr/openexr/archive/v2.3.0.tar.gz
ter -zxvf v2.3.0.tar.gz
cd openexr-2.3.0
cd IlmBase
./bootstrap
./configure --prefix=/home/$USER/appIlmBase
make
make install
cd ../OpenEXR
./bootstrap
./configure --prefix="/home/$USER/app/openexr" --with-ilmbase-prefix="$HOME/app/IlmBase"
make
make install
