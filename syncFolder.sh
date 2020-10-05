#!/bin/bash

function firstSync {
Anew=`find $1 -type f -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1` 
Bnew=`find $2 -type f -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1` 
  if [ $Anew -nt $Bnew ] 
        then
           rsync -ar --del $1 $2
           echo "$1 era mais novo"
        else 
           rsync -ar --del  $1 $2
           echo "$2 era mais novo"
        fi
}

while [ ! -d $1 ] 
do
        echo "$1 nao existe"
        sleep 1
done

while [ ! -d $2 ] 
do
        echo "$2 nao existe"
        sleep 1
done


firstSync $1 $2


while true
do
        rsync -ar --del $1 $2 || notify-send "AVISO ! Pasta $1 não pode ser sincronizada"
        sleep 300
done
