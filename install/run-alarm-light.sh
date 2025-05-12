#!/bin/bash
current_dir=`pwd`
sudo apt -y install git libyuma-dev autoconf automake pkg-config gcc libtool libxml2-dev
sudo apt -y install i2c-tools

git clone https://github.com/lightside-instruments/yuma123-netconfd-module.git -b lsi-thermometer yuma123-netconfd-module-lsi-lights
cd yuma123-netconfd-module-lsi-lights
autoreconf -i -f
./configure CFLAGS="-g -O0"  CXXFLAGS="-g -O0" --prefix=/usr
make
sudo make install
cd

git clone https://github.com/lightside-instruments/ice4pi-example-i2cslave.git -b ice4pi-example-i2cslave-ws2812b ice4pi-example-i2cslave-ws2812b
cd ice4pi-example-i2cslave-ws2812b
sudo apt -y install yosys fpga-icestorm arachne-pnr flashrom
make
sudo make load

cd

sudo cp etc/rc.local /etc/rc.local
sudo rsync -rav ${current_dir}/root/ /
