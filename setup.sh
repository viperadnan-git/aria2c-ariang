#!/bin/bash
wget -q https://downloads.rclone.org/v1.53.0/rclone-v1.53.0-linux-amd64.zip
unzip -q rclone-v1.53.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.53.0-linux-amd64:$PATH
wget -q https://github.com/P3TERX/aria2-builder/releases/download/1.35.0_2020.09.04/aria2-1.35.0-static-linux-amd64.tar.gz
tar xf aria2-1.35.0-static-linux-amd64.tar.gz
export PATH=$PWD:$PATH
mkdir -p downloads
wget -q https://cdn.jsdelivr.net/gh/P3TERX/aria2.conf@master/dht.dat
wget -q https://cdn.jsdelivr.net/gh/P3TERX/aria2.conf@master/dht6.dat
list=`curl -Ns https://cdn.jsdelivr.net/gh/ngosang/trackerslist@master/trackers_all.txt | awk '$1' | tr '\n' ',' | cat`
echo "bt-tracker=$list" >> aria2c.conf
echo $PATH > PATH