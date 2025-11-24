#!/bin/bash

# Nome do container
CONTAINER="uptime-kuma"

# Comando docker run sem o --restart=always
DOCKER_RUN_CMD="docker rm -f $CONTAINER >/dev/null 2>&1; docker run -d -p 3001:3001 -v uptime-kuma:/app/data --name $CONTAINER louislam/uptime-kuma:2"

# Comando para parar
DOCKER_STOP_CMD="docker stop $CONTAINER"

echo "Configurando cron com docker run sem --restart=always..."

(
  crontab -l 2>/dev/null;
  echo "0 8 * * 1-5 $DOCKER_RUN_CMD";
  echo "0 19 * * 1-5 $DOCKER_STOP_CMD"
) | crontab -

echo "Cron configurado!"
echo "Regras atuais:"
crontab -l
