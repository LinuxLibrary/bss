#!/bin/bash
# Author : Arjun Shrinivas
# Date : May 21 2016

echo -e "Script ran by : $USER\n"
echo -e "Number of users able to login to this system are : `grep /bin/bash /etc/passwd | wc -l`\n"
echo -e "Following users are able to login to this system :\n`grep /bin/bash /etc/passwd | awk -F: '{print $1}'`\n"
echo -e "Current disk usage is :\n`df -hT | awk '{print $6"\t"$7}'`"

# END
