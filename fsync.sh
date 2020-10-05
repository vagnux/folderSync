#!/bin/bash

FILE=~/folderSync.conf
if test -f "$FILE"; then
    awk -F: '{ print "nohup syncFolder "$1 " " $2 }' ~/folderSync.conf | bash &
else
    echo "Arquivo ~/folderSync.conf não existe"
fi

FILE=/etc/folderSync.conf
if test -f "$FILE"; then
    awk -F: '{ print "nohup syncFolder "$1 " " $2 }' /etc/folderSync.conf | bash &
else
    echo "Arquivo /etc/folderSync.conf não existe"
fi
