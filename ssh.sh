#!/bin/bash

# Passo 1: Verificar se já existe uma chave SSH
if [ -f "$HOME/.ssh/id_rsa" ]; then
    echo "Uma chave SSH já existe em $HOME/.ssh/id_rsa"
else
    # Passo 2: Gerar uma nova chave SSH
    echo "Gerando chave SSH..."
    ssh-keygen -t rsa -b 4096 -C "<<EMAIL AQUI>>" -f "$HOME/.ssh/id_rsa"
    echo "Chave SSH gerada com sucesso!"
fi

# Passo 3: Adicionar a chave SSH ao agente SSH
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_rsa"
echo "Chave SSH adicionada ao agente."

# Passo 4: Exibir a chave pública para o usuário copiar
echo "A chave pública gerada é:"
cat "$HOME/.ssh/id_rsa.pub"
echo "Você pode copiar a chave pública para adicionar ao GitLab."

# Opcional: Copiar automaticamente a chave pública para a área de transferência (com xclip)
if command -v xclip &> /dev/null; then
    cat "$HOME/.ssh/id_rsa.pub" | xclip -selection clipboard
    echo "A chave pública foi copiada automaticamente para a área de transferência."
else
    echo "O comando 'xclip' não está instalado. Você pode instalar o 'xclip' com o comando:"
    echo "  sudo apt install xclip"
    echo "Ou copie manualmente a chave pública com o comando: cat $HOME/.ssh/id_rsa.pub"
fi

# Fim
echo "Script de configuração da chave SSH concluído!"
