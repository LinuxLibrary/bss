#!/bin/bash

echo "enter yes or no"
read select
case $select in
y|Y|YES|yes) echo u selected yes;;
n|N|no|NO) echo u selected no;;
*) echo select yes or no;;
esac
