#!/bin/bash

#Uma das informações armazenadas no arquivo /etc/passwd é o
#shell utilizado por cada usuário do sistema (campo 7).
#Desenvolva um script que informe qual é o shell mais utilizado e quantos usuários o utilizam.

count=0
var=`cat /etc/passwd | awk -F ":" '{print $7}'`
nome=""
for i in $var; do
	aux=`cat /etc/passwd | awk -F ":" '{print $7}'|grep -c $i`
	if [ $aux -ge $count ]; then
		nome=$i
		count=$aux
	fi
done

echo $nome
echo $count