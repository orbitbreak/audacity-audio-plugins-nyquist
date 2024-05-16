#!/bin/bash

echo "Copying these files (only overwrites)":

find -name "*.ny" -type f

echo To target directory:

echo "/mnt/c/Program Files/Audacity/Plug-Ins/"

echo ...

find -name "*.ny" -type f | xargs -I {} cp {} "/mnt/c/Program Files/Audacity/Plug-Ins/"

echo ...

echo Done! Checking modified times with \"ls -lha \"/mnt/c/Program Files/Audacity/Plug-Ins/\" \| grep custom \"

ls -lha "/mnt/c/Program Files/Audacity/Plug-Ins/" | grep custom 

