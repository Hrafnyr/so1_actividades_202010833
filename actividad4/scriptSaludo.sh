#!/bin/bash
while true; do
    user_name=$(whoami) # Obtener nombre de usuario actual
    date_now=$(date +"%Y-%m-%d %H:%M:%S") # Obtener fecha actual
    echo "Hola $user_name, la fecha actual es: $date_now"
    sleep 1
done