#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <email> <huggingface_token>"
    exit 1
fi

EMAIL="$1"
HUGGINGFACE_TOKEN="$2"

# Insatll pip
sudo apt update
sudo apt install python3-pip

# Change tmp dir
echo 'export PYTHONPATH=/mydata:$PYTHONPATH' >> ~/.bashrc
sudo chmod -R 777 /mydata
mkdir /mydata/tmp
echo 'export TMPDIR=/mydata/tmp' >> ~/.bashrc
echo 'export TMP=/mydata/tmp' >> ~/.bashrc
echo 'export TEMP=/mydata/tmp' >> ~/.bashrc
source ~/.bashrc

# Install nvidia-smi driver

sudo add-apt-repository ppa:graphics-drivers/ppa 
sudo apt update
sudo apt install nvidia-driver-535

# Setup huggingface credentials
# FIXME: Replace with your real hugging face token

mkdir /mydata/huggingface 
echo "export HF_TOKEN=$HUGGINGFACE_TOKEN" >> ~/.bashrc
echo 'export HF_HOME=/mydata/huggingface' >> ~/.bashrc

# Install vllm
sudo pip install vllm --target=/mydata --no-cache-dir


# Setup github credentials
# FIXME: Replace with your real email address; Add the cat result to the github
ssh-keygen -t rsa -b 4096 -C "$EMAIL"
cat ~/.ssh/id_rsa.pub

# Clone from private repo
# git clone git@github.com:YuningCong01/CSE585_Cache.git

source ~/.bashrc