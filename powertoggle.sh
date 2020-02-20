#toggle right screen on and off

#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


moviemode=`cat $DIR/.togglevar`
echo $(($moviemode + 1 )) > $DIR/.togglevar



echo $moviemode
case $moviemode in
        0)
            echo "1" > $DIR/.togglevar
            xrandr --output DP-1-1 --off
            exit 0
            ;;
        *)
            echo "0" > $DIR/.togglevar
            echo "initialized"
            xrandr --output DP-1-1 --right-of DP-1-2 --auto
            exit 1
esac
