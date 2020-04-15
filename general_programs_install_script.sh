#!/bin/sh
# Script to install general purpose programs
# Programs this sript installs
# 1. Bash
# 2. Screen
# 3. Java
# 4. dos2unix
# 5. Vim
# 6. ssh


sudo apt-get update -y

#Install Bash
sudo apt-get bash -y

#Install screen
sudo apt-get install screen -y

#Java install
sudo apt-get install openjdk-8-jdk openjdk-8-jre -y

#Install dos2unix
sudo apt-get install dos2unix -y

#Install Vim
sudo apt-get install vim -y

#Install ssh/Setup
sudo apt-get install ssh -y
sudo update-rc.d ssh defaults -y
sudo systemctl enable ssh.socket -y
sudo systemctl enabled ssh
sudo service ssh restart



printf "\n\n\n\nVersions:\n"
printf "\n\nScreen:\n"
screen -version
printf "\n\nBash:\n"
bash -version
printf "\n\nJava:\n"
java -version
printf "\n\nJava JDK:\n"
javac -version
printf "\n\nDos2Unix:\n"
dos2unix --version
printf "\n\nVim:\n"
vim --version
printf "\n"
