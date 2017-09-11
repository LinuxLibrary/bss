#!/bin/bash
for var in `ls`
do 
`chmod u+x $var`
`chmod g+x $var`
`chmod o+x $var`
done
