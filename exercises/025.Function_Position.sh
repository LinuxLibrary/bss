#!/bin/bash

function func {
	echo function having arguments $1 and $2
	local sum=$[$1+$2]
	echo sum is $sum
	}

echo script having arguments $1 $2 $3 $4
func $1 $2
echo
func $3 $4
