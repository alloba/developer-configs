#!/bin/bash

# this should ONLY by run inside of a linux environment or WSL. it just copies over the current bash history file. 
# one day i want to use that file for some visualization project or something. 

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $DIR
cp ~/.bash_history $DIR/.bash_history
echo "Bash History copied to backup script directory"
