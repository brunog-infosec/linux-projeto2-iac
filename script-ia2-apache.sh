#!/bin/bash

echo "Atualizando repositórios e pacotes do servidor..."
apt-get update && apt-get upgrade -y
echo "Instalando Apache2..."
apt-get install apache2 -y
echo "Instalando unzip..."
apt-get install unzip -y
echo "Instalações concluidas..."
sleep 2

echo "Baixando e copiando os arquivos da aplicação..."

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/
echo "Copia dos arquivos concluida da aplicação concluída!"
sleep 3

echo "Deseja verificar agora os logs de acesso ao Servidor Web? (Y/N): "
read resposta

sleep 2

if [ "$resposta" == "Y" ] || [ "$resposta" == "y" ]; then
    echo "Escutando acessos ao servidor... (Ctrl+C Para Sair) "
    sleep 3
    tail -f /var/log/apache2/access.log
else
    echo "Script Finalizado! Você optou por não visualizar os logs."
    sleep 3
fi

