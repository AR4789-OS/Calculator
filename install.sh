#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then 
    sudo bash ./install.sh
    exit 1
fi

SCRIPT_LOCATION=$(cd -- "$( dirname -- "./$BASH_SOURCE[0]" )" &> /dev/null && pwd)

FILE="/home/$SUDO_USER/Desktop/aros-calculator.desktop"
if [ -f $FILE ]; then
    rm $FILE
    touch $FILE
else 
    touch $FILE
fi

printf "
[Desktop Entry]
Name=Calculator
Comment=AR OS Calculator
Exec=$SCRIPT_LOCATION/calculator
Icon=$SCRIPT_LOCATION/Calculator.png
Terminal=false
Type=Application
Categories=Utility;Calculator;
" >> $FILE

chmod a+x $FILE


APPFILE="/usr/share/applications/aros-calculator.desktop"
if [ -f $APPFILE ]; then
    rm $APPFILE
    touch $APPFILE
else 
    touch $APPFILE
fi


printf "
[Desktop Entry]
Name=Calculator
Comment=AR OS Calculator
Exec=$SCRIPT_LOCATION/calculator
Icon=$SCRIPT_LOCATION/Calculator.png
Terminal=false
Type=Application
Categories=Utility;Calculator;
" >> $APPFILE
