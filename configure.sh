#!/bin/bash
#Require
#sudo apt-get install libtool autoconf

#git clone https://github.com/eclipse/wakaama
#cd wakaama
git submodule init
git submodule update
cd examples/shared/tinydtls/
autoreconf -i
./configure

cd ../../../../
cmake -DDTLS=1 wakaama/examples/client
make

./lwm2mclient -h 127.0.0.1 -p 5684 -4 -n rpi -i rpi.identity -s 1234 -t 30
