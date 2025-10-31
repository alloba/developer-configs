#!/bin/bash

# Automatically convert all files in a directory 
# To Unix-friendly line endings. 
# Apparently this is going to be an issue in my life now, 
# since git and WSL feel like getting fresh with me lately...   
#
# Requires dos-2-unix be installed. 

if ! type dos-2-unix &> /dev/null; then echo "dos2unix not detected on path. please install" && exit 1; fi

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "line-fixer.sh {folder_path} to convert all in folder."
    echo "  Leave path blank to convert current directory."
    exit
fi

if [[ $# -eq 0 ]]; then 
    find .    -type f -exec dos2unix {} \;
else 
    find "${1}" -type f -exec dos2unix {} \;
fi 

