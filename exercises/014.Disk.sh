#!/bin/bash

tmpfile="/tmp/sh$$tmp"
for i in `awk -F: '{ if ($3 >= 500 ) print $6 }' /etc/passwd `
do
	du -s $i >> $tmpfile
done

sort -rn $tmpfile
#rm $tmpfile
exit 0
