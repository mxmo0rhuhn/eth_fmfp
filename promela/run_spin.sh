#!/bin/bash

set -e

if [ -z $1 ]; then  
  echo "No filename provided - exiting"
  exit 1
else  
  file=$1
fi 

# convenience
clear 

# create model
spin -a ${file}.pml

# compile it
gcc -o ${file}.out -march=corei7 -O2 -pipe pan.c

# run it
./${file}.out
