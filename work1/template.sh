#! /bin/bash
while true
do
	clear
	cat <<!
	------------------------------------------------------------------------
	|                                                                      |
	|   Menu de Usuario                                                    |
	|                                                                      |		
	|   1 - ls                                                             |		
	|   2 - ps aux                                                         |	
	|   3 - who                                                            |
	|   4 - exit                                                           |
	|   Digite sua Opcao :                                                 |
	|                                                                      |
	------------------------------------------------------------------------
!
	while
	tput cup 12 8 ; read opt
	[ "$opt" = "" ]
	do
		: #Comando NULL(Apenas para o loop ocorrer
	done
	case $opt in
		1) clear
			ls ;;
		2) clear
			ps aux ;;
		3) clear
			who ;;
		4) clear
			echo Adios Amigo
			exit 0 ;;
		*) clear
			echo Opcao Invalida!
			sleep 2
			;;
	esac
	echo Tecle Enter para continuar.
	read
done
