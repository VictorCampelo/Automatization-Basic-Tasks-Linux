#! /bin/bash

cpu=`ps aux| awk '{print $3}' | grep -v CPU`
aux=0
for valor in $cpu
do
	aux=`echo $aux + $valor | bc -l`
done
echo "CPU use: %"$aux