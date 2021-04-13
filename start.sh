#!/bin/bash
if [ -f .env ]; then
    echo ".env file found, sourcing it"
	set -o allexport
	source .env
	set +o allexport
fi
export PATH="$(cat PATH)"
if [[ -n $CONFIG && -n $DESTINATION ]]; then
	echo "Config detected"
	echo "[DRIVE]" > rclone.conf
	echo "$(echo $CONFIG|base64 -d)" >> rclone.conf
	echo "on-download-stop=./delete.sh" >> aria2c.conf
	echo "on-download-complete=./on-complete.sh" >> aria2c.conf
	chmod +x delete.sh
	chmod +x on-complete.sh
fi
echo "rpc-secret=$SECRET" >> aria2c.conf
aria2c --conf-path=aria2c.conf&
yarn start