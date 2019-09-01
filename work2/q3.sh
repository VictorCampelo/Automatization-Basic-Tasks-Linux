#!/bin/bash

#Elaborar um script que receba um nome de arquivo como parâmetro e 
#verifique se esse arquivo existe. Em caso afirmativo, imprimir o seu tamanho em bytes.

if ls|grep $1 > /dev/null 
then
	wc -c $1
else
	echo arquivo nao encontrado 	
fi