#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose: Functions definitions
# Created: 24-Jan-2015
# Modified:

#################
##  Functions  ##
#################

# Show Date
function showdate() {
  date +%F
}
# Show Time
function showtime() {
  date +%r
}

# Get User Info
function getuserinfo() {
  clear
  echo Please enter your Firstname and Lastname
  read firstname lastname
  echo $firstname $lastname
}
# Mail Admin
function mailadmin() {
  echo Success: mail -s "Successful execution of Script" root
}

#################
##  Main Code  ##
#################

showdate
showtime
getuserinfo
mailadmin

# End of File
