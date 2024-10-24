#!/bin/bash

email=""
hf_token=""

# Function to print usage
usage() {
    echo "Usage: $0"
    exit 1
}

# Parse the arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --email)
            email="$2"
            shift 2 # Shift past the argument and its value
            ;;
        --token)
            hf_token="$2"
            shift 2 # Shift past the argument and its value
            ;;
        *)
            usage
            ;;
    esac
done

sudo chmod -R 777 /mydata

# Change tmp dir
echo 'export PYTHONPATH=/mydata:$PYTHONPATH' >> ~/.bashrc
echo 'export TMPDIR=/mydata/tmp' >> ~/.bashrc
echo 'export TMP=/mydata/tmp' >> ~/.bashrc
echo 'export TEMP=/mydata/tmp' >> ~/.bashrc

# Setup huggingface credentials
if [ -n "$hf_token" ]; then
    echo "export HF_TOKEN=$hf_token" >> ~/.bashrc
fi
echo 'export HF_HOME=/mydata/huggingface' >> ~/.bashrc

# Setup github credentials
# Add the cat result to the github
if [ -n "$email" ]; then
    ssh-keygen -t rsa -b 4096 -C "$email" -N "" -f ~/.ssh/id_rsa
    cat ~/.ssh/id_rsa.pub
fi