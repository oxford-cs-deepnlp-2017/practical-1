#!/bin/bash

##############################
# check if installation is already done in user's dir
USER_DIR=/home/scratch/$USER/anaconda3
if [ -d $USER_DIR ] ; then
    echo You already have a directory called $USER_DIR
    echo You have either already installed it, or you can remove this
    echo directory and rerun this script if you are trying to reinstall.
    exit 1
fi

##############################
# install python

echo Installing python 3.5

# Go to tmp
cd /tmp/

# Download Anaconda python 3.5
wget --quiet https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
bash Anaconda3-4.2.0-Linux-x86_64.sh -b -p $USER_DIR
rm Anaconda3-4.2.0-Linux-x86_64.sh

# Add anaconda3 path
printf "export PATH='%s/bin':\$PATH" "$USER_DIR" >> ~/.bashrc
source ~/.bashrc

# Update anaconda
conda update -y conda

# Install word2vec dependencies
pip install gensim

echo
echo Anaconda python 3.5 has been installed
echo