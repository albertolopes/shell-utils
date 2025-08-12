#!/bin/bash

# Atualizar o sistema
sudo apt update -y
sudo apt upgrade -y

# Instalar dependências necessárias
sudo apt install -y wget apt-transport-https curl lsb-release gnupg snapd

# Instalar o Maven
echo "Instalando o Maven..."
sudo apt install -y maven

# Baixar e instalar JDK 11
echo "Instalando JDK 11..."
sudo apt install -y openjdk-11-jdk

# Baixar e instalar JDK 21
echo "Instalando JDK 21..."
wget https://download.java.net/java/ga/jdk21/33/binaries/openjdk-21_linux-x64_bin.tar.gz
sudo tar -xzf openjdk-21_linux-x64_bin.tar.gz -C /opt
sudo ln -s /opt/jdk-21 /opt/jdk21

# Configurar o JDK 11 como o padrão
echo "Configurando o JDK 11 como o padrão..."
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-11-openjdk-amd64/bin/java 1
sudo update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac 1
sudo update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac

# Verificar a instalação
echo "Verificando as versões instaladas..."
java -version
javac -version
mvn -version

# Instalar IntelliJ IDEA Ultimate via Snap
echo "Instalando IntelliJ IDEA Ultimate via Snap..."
sudo snap install intellij-idea-ultimate --classic

# Instrução para iniciar o IntelliJ IDEA
echo "Instalação do IntelliJ IDEA Ultimate concluída!"
echo "Para iniciar o IntelliJ IDEA, execute 'intellij-idea-ultimate' no terminal."
