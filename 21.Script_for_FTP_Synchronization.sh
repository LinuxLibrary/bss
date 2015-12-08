#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose: To synchronize folders between disperate hosts

###############
## Variables ##
###############

SCRIPTHOME="/root/temp2"
LETSCRIPT=$SCRIPTHOME/ftpsynchronize.lftp

###############
## Main Code ##
###############

lftp -f $LETSCRIPT

# End of File
