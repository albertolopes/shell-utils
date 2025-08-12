#!/bin/bash
# Script para configurar o Grass para iniciar automaticamente no login do usuário

set -e

echo "Criando pasta ~/apps se não existir..."
mkdir -p "$HOME/apps"

echo "Movendo o Grass da Área de trabalho para ~/apps..."
mv "$HOME/Área de trabalho/grass" "$HOME/apps/grass"

echo "Tornando o Grass executável..."
chmod +x "$HOME/apps/grass"

echo "Criando serviço systemd para iniciar o Grass automaticamente..."

mkdir -p "$HOME/.config/systemd/user"

cat > "$HOME/.config/systemd/user/grass.service" <<EOF
[Unit]
Description=Inicia o Grass AppImage no login do usuário
After=graphical.target

[Service]
ExecStart=/bin/bash -lc '$HOME/apps/grass'
Restart=on-failure
Environment=DISPLAY=:0
Environment=XAUTHORITY=%h/.Xauthority

[Install]
WantedBy=default.target
EOF

echo "Recarregando systemd e ativando o serviço grass..."
systemctl --user daemon-reload
systemctl --user enable grass.service
systemctl --user start grass.service

echo "Configuração concluída. O Grass será iniciado automaticamente no login."
