#!/bin/bash

# Navigate to home directory
cd ~

# Download YCSB tarball
curl -O --location https://github.com/brianfrankcooper/YCSB/releases/download/0.17.0/ycsb-0.17.0.tar.gz

# Extract YCSB tarball
tar xfvz ycsb-0.17.0.tar.gz

# Clone YCSB repository
git clone https://github.com/brianfrankcooper/YCSB.git
