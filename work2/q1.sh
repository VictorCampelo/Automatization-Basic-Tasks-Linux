#!/bin/bash
#Elaborar um script que solicite a informação de um nome de usuário e verifique
#se o nome informado é um usuário válido no sistema 
#(desconsiderando as diferenças entre maiúsculas e minúsculas).

echo nome de usuario

read var

user=`cat /etc/passwd | awk -F ":" '{print $1}'`

for i in $user; 
do
	if [[ ${var^^} = ${i^^} ]]; then
		echo usuario valido
	fi
done