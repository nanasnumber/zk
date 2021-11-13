#!/bin/bash

# Script to install program

BIN_PATH="/usr/local/bin"
USER_HOME=$HOME;
PROGRAM_DIR=".zk";
DATA_PATH=$USER_HOME/$PROGRAM_DIR;

echo "Installing zk to $BIN_PATH...";

mkdir $DATA_PATH;

sudo cp ./bin/zk $BIN_PATH;

echo "zk installed!"


