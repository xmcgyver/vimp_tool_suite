#!/bin/bash
# vimp = vi + pimp (allows vi to open a file from a grep search at the specified line number of the search result)
# (example usage prompt$ vimp /etc/hosts:23)
# tested on OS X 10.6 only


x="$1"
y=`basename $1`

# if colon and number entered
if [[ $y == *:* ]]
then
	echo -n -e "\033]0;${y%%:*}\007"
	vi +${x#*:} "${x%%:*}"
else 
	echo -n -e "\033]0;$y\007"
	vi "${x}"
fi

# reset terminal title back to ""
echo -n -e "\033]0;\007"



