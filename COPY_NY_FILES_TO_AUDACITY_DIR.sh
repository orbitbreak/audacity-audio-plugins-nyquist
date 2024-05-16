#!/bin/bash
findfilepattern="custom_*.ny"
grepfilepattern="custom_*.*ny"
targetplugindir="/mnt/c/Program Files/Audacity/Plug-Ins/"

echo "Copying these files matching $findfilepattern":
find -name "$findfilepattern" -type f

echo ...

echo To target directory: \"$targetplugindir\"
echo         AKA winpath: \"$( wslpath -w "$targetplugindir" )\" 
echo "   (Requires admin terminal session)"

echo ...

find -name "$findfilepattern" -type f | xargs -I {} cp -f {} "$targetplugindir"

echo ...

echo Done! Check results with: ls -lha \"$targetplugindir\" \| grep \"$grepfilepattern\"
ls -lha "$targetplugindir" | grep --color "$grepfilepattern"

