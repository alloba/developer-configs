#!/bin/zsh

# Quick little script to restart the displaylink service on macos.
# I've consistently had an issue where switching displays around while the machine is sleeping causes
# the software to kinda throw up its hands and stop recognizing the monitors until you restart the thing.
# Surely one day I'll no longer need this...

# Very rarely, the service still freezes up when this script is run.
# That's just a whole trip to the activity monitor, sadly.

killall DisplayLinkUserAgent
sleep 1
open -a DisplayLink\ Manager