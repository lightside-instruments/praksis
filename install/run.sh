#!/bin/bash
current_dir=`pwd`
sudo apt -y install git libyuma-dev autoconf automake pkg-config gcc libtool libxml2-dev
sudo apt -y install i2c-tools
git clone https://github.com/lightside-instruments/raspberry-pi-i2c-sts3x.git
cd raspberry-pi-i2c-sts3x/example-usage-one-value-centigrade/
make
sudo cp sts3x_i2c_example_usage /usr/bin
cd
git clone https://github.com/lightside-instruments/yuma123-netconfd-module.git -b lsi-thermometer yuma123-netconfd-module-lsi-thermometer
cd yuma123-netconfd-module-lsi-thermometer
autoreconf -i -f
./configure CFLAGS="-g -O0"  CXXFLAGS="-g -O0" --prefix=/usr
make
sudo make install
cd

sudo cp etc/rc.local /etc/rc.local
sudo rsync -rav ${current_dir}/root/ /
