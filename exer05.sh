#! /bin/bash


#Recebe dois números como parâmetro e mostra a
#relação entre eles. Exemplo:
#prompt$ ./relacao.sh 3 5
#3 é menor 5

if [[ $1 -lt $2 ]]; then
	echo $1 é menor que $2
elif [[ $1 -gt $2 ]]; then
	echo $1 é maior que $2
else
	echo $1 é igual a $2		
fi