#! /bin/bash

h=`uptime | awk '{print $1}' | awk -F ":" '{print $1}'`
if [ $h -ge 0 -a $h -lt 12 ]; then
	echo "Bom dia"
elif [ $h -ge 12 -a $h -lt 18 ]; then
	echo "Boa tarde"
else
	echo "Boa Noite"		
fi