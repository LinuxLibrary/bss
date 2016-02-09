#!/bin/bash

echo -e "1) a \n 2) b \n 3) c \n 4) d \n 5) e" 
echo "select any one:"

read var1
case $var1 in
a) echo options are
echo -e "1) a1 \n 2)a2 \n 3)a3 enter"
read var2
case $var2 in
a1) echo "one";;
a2) echo "two";;
a3) echo "three";;
*) echo default ;;
esac
;;

b) echo "case two selected";;
c) echo "case three selected";;
*) echo default ;;
esac
