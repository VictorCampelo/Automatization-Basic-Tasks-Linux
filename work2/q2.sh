#!/bin/bash

#Escreva um script que receba o nome de um arquivo como parâmetro e que,
#caso este arquivo não exista, escreva a lista de arquivos de /usr/bin neste arquivo.
#Se o arquivo existir, exibe uma mensagem dizendo que nada foi feito porque o arquivo já existe.

if ls|grep $1 > /dev/null 
then
	echo Nada foi feito. Arquivo ja existe
else
	ls /usr/bin > $1 	
fi