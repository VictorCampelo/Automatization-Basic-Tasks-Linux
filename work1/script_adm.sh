#! /bin/bash
#1 – Ver processos ativos
#2 – Mostra os files systems da máquina
#3 – Mostra a quanto tempo a máquina está no ar
#4 – Usuários ativos na máquina
#5 – Versão do kernel
#6 – Lista de usuários da máquina
#7 – Sair do sistema
while true
do
	clear
	cat <<!
	------------------------------------------------------------------------
	|                                                                      |
	|   Administrative panel                                               |
	|                                                                      |		
	|   1 - active processes                                               |		
	|   2 - show files systems                                             |	
	|   3 - show what time is active                                       |
	|   4 - show actives users                                             |
	|   5 - kernel version                                                 |
	|   6 - list of users                                                  |	
	|   7 - exit                                                           |
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
			ps aux ;;
		2) clear
			df -T -x tmpfs -x devtmpfs | grep /dev | awk -F " " '{print $2}' |sort ;;
		3) clear
			v1=`uptime|awk '{print $3}'|cut -d "," -f1|awk -F ":" '{print $2}'`
			uptime|awk '{print $2" "$3}'| cut -d "," -f1
	        while true
	        do
	            if [[ `uptime|awk '{print $3}'|cut -d "," -f1|awk -F ":" '{print $2}'` -ne $v1 ]]; then
	            	clear
	            	uptime|awk '{print $2" "$3" "$4}'| cut -d "," -f1
	            	echo "digite 1 para sair: "
	            	read -t5 opt2 
	            	[ "$opt2" = "" ]
	            	if [[ $opt2 -eq 1 ]]; then
	            		break
	            	else
	            		continue
	            	fi
	            fi
	            sleep 0.20
	            printf "\r"
	        done ;;
		4) clear
			who | awk '{print $1}' ;;
		5) clear
			uname -mrs ;;
			#dpkg -l| grep -F linux-image |awk '{print $2 " " $3 " "$4}'
		6) clear
			cat /etc/passwd | awk -F ":" '{print $1}' ;;
		7) clear
			exit 0 ;;						
		*) clear
			echo Opcao Invalida!
			sleep 2
			;;
	esac
	echo Tecle Enter para continuar.
	read
done
