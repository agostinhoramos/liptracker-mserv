#!/bin/sh

cd ~
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y unzip make gcc python git wiringpi python3-pigpio python-setuptools python3-rpi.gpio
sudo apt-get install -y python3-distutils

wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip
cd pigpio-master
sudo make
sudo make install

cd ~
git clone https://github.com/geekworm-com/x-c1
cd x-c1
sudo chmod +x *.sh
sudo bash install-ubuntu.sh

echo "alias xoff='sudo /usr/local/bin/x-c1-softsd.sh'" >> ~/.bashrc
sudo reboot