#!/bin/bash
# This script will change the default aws profile for the current session. 
# It expects to be sourced (not executed normally). If it detects that it has not been sourced, a warning will pop. 
# By default the profile that gets set is 'personal'. 
# This variable should only persist during the current shell session. profile will be reverted back to default after. 

PROFILE="personal";
if ! [ -z ${1+x} ]; then  
    PROFILE="${1}"
fi

$(return >/dev/null 2>&1)

# What exit code did that give?
if [ "$?" -eq "0" ]
then
    echo "AWS_PROFILE=${PROFILE}"
    export AWS_PROFILE=$PROFILE;
else
    echo "This script is not sourced. Must run script via source for it to work properly!"
fi


