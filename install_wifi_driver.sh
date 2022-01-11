#!/bin/sh

has_cloned=1
nb_cores=4
driver_location=/home/${USER}/Downloads/wifi_driver

if [ has_cloned -ne 1 ]; then
    git clone git@github.com:RinCat/RTL88x2BU-Linux-Driver.git ${driver_location}
fi

cd ${driver_location} && \
make clean && make -j${nb_cores} && sudo make install && sudo modprobe 88x2bu rtw_switch_usb_mode=1
