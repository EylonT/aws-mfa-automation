#!/bin/bash

clear
DIR=~/.aws

# Check if the aws cli is installed.
# if not, the script will install it, and then check if pip is installed. 
# if not, it'll install it and in the end prompt the user to enter aws credentials for the cli.

if [[ ! $(which aws) ]]; then
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    echo "Please enter your credentials."
    aws configure
    if [[ ! $(which pip) ]]; then
        sudo apt install python3-pip -y
    fi
    pip install boto3

elif [[ ! -d "$DIR" ]]; then
	echo "Please enter your credentials."
    aws configure
    if [[ ! $(which pip) ]]; then
        sudo apt install python3-pip -y
    fi
    pip install boto3

else
    echo "Everything is setup, you can run the 'aws_ecs_management_tool.py' script."
fi