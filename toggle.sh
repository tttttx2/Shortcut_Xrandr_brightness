#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


moviemode=`cat $DIR/.togglevar`
echo $(($moviemode + 1 )) > $DIR/.togglevar



echo $moviemode
case $moviemode in
        0)
            echo "1"
            xrandr --output HDMI-0 --brightness 0
            xrandr --output DVI-1 --brightness 1
            xrandr --output DVI-0 --brightness 0
            ;;
         
        1)
            echo "2"
            xrandr --output HDMI-0 --brightness 1
            xrandr --output DVI-1 --brightness 0
            xrandr --output DVI-0 --brightness 0
            ;;
        2)
            echo "3"
            xrandr --output HDMI-0 --brightness 0
            xrandr --output DVI-1 --brightness 0
            xrandr --output DVI-0 --brightness 1
            ;;
        *)
            echo "0" > $DIR/.togglevar
            echo "initialized"
            xrandr --output HDMI-0 --brightness 1
            xrandr --output DVI-1 --brightness 1
            xrandr --output DVI-0 --brightness 1
            exit 1
 
esac
