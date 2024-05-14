#!/bin/bash

# Update package lists
sudo apt-get update

# Upgrade installed packages
sudo apt-get upgrade -y

# Install required packages
sudo apt-get install -y openjdk-8-jre-headless unzip
