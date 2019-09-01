#! /bin/bash

while [[ true ]]; do
	login=`who|awk '{print $1}'`
	if [[ login = root ]]; then
		echo "Usuario root logou"
		break
	else
		echo "nao é root"
		sleep 2.0
		continue	
	fi
done