#!/bin/bash
findfilepattern="custom_*.ny"
grepfilepattern="custom_*.*ny"

echo "Copying these files matching $findfilepattern":
find -name "$findfilepattern" -type f
echo ...
echo  To target directory: \"/mnt/c/Program Files/Audacity/Plug-Ins/\"
echo "        AKA winpath: \"$(wslpath -w '/mnt/c/Program Files/Audacity/Plug-Ins/')\" "
echo "   (Requires admin terminal session)"
echo ...
find -name "$findfilepattern" -type f | xargs -I {} cp -f {} "/mnt/c/Program Files/Audacity/Plug-Ins/"
echo ...
echo Done! Check results with: ls -lha \"/mnt/c/Program Files/Audacity/Plug-Ins/\" \| grep \"$grepfilepattern\"
ls -lha "/mnt/c/Program Files/Audacity/Plug-Ins/" | grep --color "$grepfilepattern"

