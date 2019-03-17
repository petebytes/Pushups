#!/bin/bash

# Set your name
name="Troy"

# Desired volume 1-10
MyVolume=4;

# Use this range to raise the amount of push-ups.
range=5;

# Generate a random number.
randomNum=`echo $RANDOM`;

# Generate numbers to do push-ups.
pushupNum=`expr $randomNum % $range`;
pushupNum=`expr $pushupNum + $range`;

# Ocassinally you need someone’s cheer.
cheer=`expr $randomNum % $pushupNum`;

# "Grab current volume and mute state"
VolumeStart=$(osascript -e 'output volume of (get volume settings)')
VolumeMuted=$(osascript -e 'output muted of (get volume settings)')

# "Set desired volume and unmute"
# unmute
osascript -e "set volume output muted false";
# fade in volume
osascript -e "set volume 0"
SystemVolume=0;

afplay -v 0.4 /Volumes/6TB-RAID1/Multimedia/Music/Amazon-Music/OneRepublic/Native\ \(Deluxe\)\ \[+digital\ booklet\]/01\ -\ Counting\ Stars.mp3 &

for i in $( seq 1 $MyVolume )
do
  SystemVolume=$((SystemVolume+10))
  osascript -e "set volume output volume ${SystemVolume}"
  sleep .75;
done

sleep 1;
#Will tell you how many push-ups to do with pumping music.
say -v Samantha "$name get ready to do ${pushupNum} pushups"

#This is the part to count and tell you the number of push-ups.
counter=1;
sleep 10;
while [ $counter -le $pushupNum ]
do
if [ $counter -eq $cheer ]
then
say -v Samantha "Let’s Go.";
fi
say -v Samantha $counter;
sleep 0.5;
let counter=counter+1;
done

sleep 2;
say -v Samantha "$name, Great Job!";

# "decrement volume"
for i in $( seq 1 $MyVolume )
do
  SystemVolume=$((SystemVolume-10))
  osascript -e "set volume output volume ${SystemVolume}"
  sleep .5;
done

killall afplay;

#"Reset initial volume sessings"
if [ $VolumeMuted == 'true' ]
  then
    osascript -e "set volume output muted true"
  fi
if [ $VolumeMuted == 'false' ]
  then
    osascript -e "set volume output muted false"
  fi
osascript -e "set volume output volume ${VolumeStart}"
