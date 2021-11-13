#!/bin/bash

# Script to install program

BIN_PATH="/usr/local/bin"
USER_HOME=$HOME;
PROGRAM_DIR=".zk";
DATA_PATH=$USER_HOME/$PROGRAM_DIR;

echo "Uninstalling zk from $BIN_PATH...";

sudo rm $BIN_PATH/zk;

echo "zk uninstalled!"


