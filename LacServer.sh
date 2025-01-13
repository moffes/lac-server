#!/bin/bash

echo 'Обновление пакетов'
sudo apt-get update && sudo apt-get upgrade -y

echo 'Установка зависимостей'
sudo apt-get install -y screen unzip libc6-i386 lib32stdc++6 libncurses5:i386

echo 'Загрузка необходимых файлов'
sudo wget https://lacrimesonline.com/builds/LAC/LAC_Linux_v1.8.zip -O LAC_Linux_v1.8.zip

echo 'Распаковка файлов'
sudo unzip LAC_Linux_v1.8.zip

echo 'Активация root'
sudo chmod +x LAC_Linux_v1.8.x86_64

echo 'Создание директорий'
sudo mkdir -p /root/.config/unity3d/MA/LAC
sudo mkdir -p /root/.config/unity3d/MA/editor

echo 'Создание конфигурации'
sudo bash -c 'cat > /root/.config/unity3d/MA/LAC/ServerConfig.txt << EOF
# Стандартные карты:
# Garage - гараж, RagdollParty, TrainFacility - ТДМ
# ZombieSurvival, NewTerrainRamps - рампы, Island - город, CarSoccer - футбол транспортом

# Кастомные карты нужно грузить по пути .config/unity3d/MA/editor

(Basic)
restart timer=never # Время рестарта (никогда - never)
max players=100 # Максимум игроков (Максимум - 65634)
map name=Island # Карта (Можно кастомные, или стандартные)
starting port=7777 # Порт сервера (Можно любой открытый)

(Server List)
server language=English # Язык сервера
server password=none # Пароль сервера (Без пароля - none)

(Roleplay)
username=Sigma # Ник хоста (Любой)
password=0000 # Пароль хоста (Любой)
EOF'

echo 'Удаление архивного файла'
sudo rm LAC_Linux_v1.8.zip

echo -e "\033[36mУстановка завершена! \n\nНастройте конфигурацию сервера по пути: .config/unity3d/MA/LAC/ServerConfig.txt\nЕсли вы завершили настройку конфигурации сервера, запустите его! \n\nДля запуска сервера, последовательно используйте команды ниже:\n1. screen -S любое_имя\n2. ./LAC_Linux_v1.8.x86_64\n3. Ctrl + A + D\n\nЕсли вам нужно вернуться к консоли сервера, используйте: screen -r введеное_имя\nДля выключения сервера, вернитесь в консоль сервера, и используйте: Ctrl + Z\033[0m"