#!/bin/bash

echo "#################### Not recommended in production ####################"
echo "This script is for test purposes only, do not use in production"
echo "You can create your self signed certificates with these commands :"
echo "FILENAME=ha-remote-cli"
echo "openssl genrsa -out $FILENAME.key 1024"
echo "openssl req -new -key $FILENAME.key -x509 -days 3653 -out $FILENAME.crt"
echo "cat $FILENAME.key $FILENAME.crt >$FILENAME.pem"
echo "chmod 600 $FILENAME.key $FILENAME.pem"
echo "#######################################################################"
echo ""

case $1 in
	server)
		name=ha-remote-server
		read -p "Please provide the CN: " commonName
		;;
	client)
		name=ha-remote-cli
		commonName=localhost
		;;
	*)
		echo "argument must be client or server"
		exit 1
		;;
esac


openssl req -x509 -newkey rsa:4096 -keyout $name.key -out $name.crt -days 3650 -nodes -subj "/CN=$commonName"
cat $name.key $name.crt >> $name.pem
chmod 600 $name.key $name.pem
