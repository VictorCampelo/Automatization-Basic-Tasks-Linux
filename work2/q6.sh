#!/bin/bash

#Faça um script que receba duas palavras como parâmetro e verifica 
#se a primeira palavra está contida dentro da segunda. 
#Só mostra mensagem informativa em caso de sucesso, do contrário não mostra nada.

echo $2 | grep $1 > /dev/null

if [ $? -eq "0" ]
then
	echo "$1 está contida em $2"
else
	echo "$1 NÃO está contida em $2"
fi