#!/bin/bash

sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt install ansible