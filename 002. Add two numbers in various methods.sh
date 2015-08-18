#!/bin/bash
# Author : Arjun Shrinivas
# Date : 18th Aug 2015
 
 
echo Enter a number
read A
echo Enter another number
read B
 
# First method
SUM=$(($A+$B))
echo First Method
echo "The sum of $A and $B is : $SUM"
 
# Second method
SUM=$[$A + $B]
echo Second Method
echo "The sum of $A and $B is : $SUM"
 
# Third method
SUM=`expr $A + $B`
echo Third Method
echo "The sum of $A and $B is : $SUM"
 
# END
