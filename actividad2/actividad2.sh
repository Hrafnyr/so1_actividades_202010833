#!/bin/bash

GITHUB_USER="Hrafnyr"

# Concatenar usuario a la URL
URL_GIT="https://api.github.com/users/$GITHUB_USER"

# Obtener datos json: sudo apt-get install jq -> -s: Muestra solo respuesta de url 
CONSULTA=$(curl -s $URL_GIT)

# Datos solicitado -> -r elimina comillas
USER_NAME=$(echo "$CONSULTA" | jq -r .login)
USER_ID=$(echo "$CONSULTA" | jq -r .id)
USER_CREATED=$(echo "$CONSULTA" | jq -r .created_at)

INFORMATION="Hola $USER_NAME. User ID: $USER_ID. Cuenta fue creada el: $USER_CREATED"

echo $INFORMATION

# Crear directorio de log file: -p crea jeraquía por si algun dir no existe.
PATH_LOG="/tmp/$(date +'%Y%m%d')"
mkdir -p "$PATH_LOG"

echo $INFORMATION >> "$PATH_LOG/saludos.log"

#Cronjob a 5 minutos
ACTUAL_PATH=$(realpath "$0") # Obtener ruta absoluta
ENTRY="*/5 * * * * $ACTUAL_PATH"

if ! crontab -l | grep -Fxq "$ENTRY"; then

    # Si no existe el cron para que no se agregue cada vez el cron ya existente
    (crontab -l ; echo "$ENTRY" ) | crontab -
    echo "Script ejecutado cada 5 minutos"
else
    echo "Script ejecutado cada 5 minutos"
fi

# -l lista los cron actual
# "*/min */hora */dia */mes */dia de la semana"
# Se coloca a la par la ruta del script a repetir
# crontab - : instala la nueva lista con el cron nuevo
