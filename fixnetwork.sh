#!/bin/sh

sudo systemctl stop NetworkManager.service
sudo systemctl disable NetworkManager.service

sudo systemctl stop NetworkManager-wait-online.service
sudo systemctl disable NetworkManager-wait-online.service

sudo systemctl stop NetworkManager-dispatcher.service
sudo systemctl disable NetworkManager-dispatcher.service

sudo systemctl stop network-manager.service
sudo systemctl disable network-manager.service

# Wait
sleep 5


sudo systemctl start NetworkManager.service
sudo systemctl enable NetworkManager.service

sudo systemctl start NetworkManager-wait-online.service
sudo systemctl enable NetworkManager-wait-online.service

sudo systemctl start NetworkManager-dispatcher.service
sudo systemctl enable NetworkManager-dispatcher.service

sudo systemctl start network-manager.service
sudo systemctl enable network-manager.service

