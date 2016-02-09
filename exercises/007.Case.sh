#!/bin/bash

cat << EOF
name me an animal and i will tell ou
ho many legs it has
EOF

read creature

case $creature in
dog|cat) echo " it has four legs";;
hen) echo " it has two legs";;
*) echo wronge choice;;
esac
