#!/bin/bash
# escaped.sh: escaped characters

echo; echo
echo "\v\v\v\v" # Prints \v\v\v\v literally.
# Use the -e option with 'echo' to print escaped characters.
echo "============="
echo "VERTICAL TABS"
echo -e "\v\v\v\v" # Prints 4 vertical tabs.
echo "=============="
echo "QUOTATION MARK"
echo -e "\042" # Prints " (quote, octal ASCII character 42).
echo "=============="
# The $'\X' construct makes the -e option unnecessary.
echo; echo "NEWLINE AND BEEP"
echo $'\n' # Newline.
echo $'\a' # Alert (beep).
echo "==============="
echo "QUOTATION MARKS"
# Version 2 and later of Bash permits using the $'\nnn' construct.
# Note that in this case, '\nnn' is an octal value.
echo $'\t \042 \t' # Quote (") framed by tabs.
# It also works with hexadecimal values, in an $'\xhhh' construct.
echo $'\t \x22 \t' # Quote (") framed by tabs.
# Thank you, Greg Keraunen, for pointing this out.
# Earlier Bash versions allowed '\x022'.
echo "==============="
echo
