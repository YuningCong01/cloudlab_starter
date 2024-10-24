#!/bin/bash

# Insatll pip
sudo apt update
sudo apt install -y python3-pip

# Change tmp dir
sudo chmod -R 777 /mydata
mkdir /mydata/tmp
export TMPDIR=/mydata/tmp
export TMP=/mydata/tmp
export TEMP=/mydata/tmp

# Install nvidia-smi driver
sudo add-apt-repository -y ppa:graphics-drivers/ppa 
sudo apt update
sudo apt install -y nvidia-driver-535

# Setup huggingface dir
mkdir /mydata/huggingface 

# Install vllm
sudo pip install vllm --target=/mydata --no-cache-dir
