#!/bin/bash
###########################################
######## Script Auditing ##################
###########################################
############### by magicsale ##############
###########################################
##################################
# GitHub: https://github.com/matteosalis04
##################################


data=$(date +"%d-%m-%Y %H:%M:%S")


if [[ $EUID != 0 ]]; then
    echo "please run as root"
    exit 0
fi

file_log="/root/audit_log.log"

if [[ ! -f "$file_log" ]]; then
    touch /root/audit_logs.log
fi
cat << "EOF"

****************************************
        AUDIT LOG - Bash, Linux
                    v.1.0
****************************************

EOF
read -p "Key: " key



# Estrai eventi di accesso negati
ausearch -i -k $key | grep "success=no" | while read line; do
    # Estrai il nome utente, orario, command e il percorso dell'eseguibile
    user=$(echo "$line" | awk -F 'euid=' '{print $2}' | awk '{print $1}')
    timestamp=$(echo "$line" | grep -oP '\bmsg=audit\(\K[^\)]+')
    command=$(echo "$line" | awk -F 'comm=' '{print $2}' | awk '{print $1}')
    exe=$(echo "$line" | awk -F 'exe=' '{print $2}' | awk '{print $1}')
    # possibile modifica ai file con echo  
    if [[ $command == "bash" ]]; then
        command=$(echo "Bash - possibile modifica file tramite shell (echo, etc) !!!!!!")
    fi

    echo "Utente: $user"
    echo "Comando: $command"
    echo "Esecuzione: $exe"
    echo "Data: $timestamp"
    echo "**************************************"
    echo ""
done | tee -a $file_log

# Install ssmtp
#echo "In allegato trovi il file di log con il report delle attività di auditing del sistema." > message.dat
#mpack -s "Report Audit - $data" -d "./message.dat" $file_log write_your_mail
#echo "Email Send!!!"

rm -rf $file_log




