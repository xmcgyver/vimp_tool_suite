#!/bin/bash
# based on srch -> srch - grep values for given project with a settings file for each project + mdfind
# but using a simple search and replace.

# ### required gsed - sudo port install gsed

# because of the command line somethings need to be escaped at the command line: ' " ; !

doFindage=0

# this is a flag to tell includes not to reload config
isUtil=1;

# load in the user config
if [ ! -n "${isConfigIncluded+x}" ]; then
	if [ ! -e "~/.srch/config" ]; then
		source ~/.srch/config
		includeName="init_config.sh"
		source $srchSuiteLocation$includeName
	else
		echo "Fail: errz 001 -> Missing configuration file: ~/.srch/config"
		exit 1
	fi
fi



#srchScriptLocation - might need to set this using get_abs_path if not already set
includeName="srch.sh"
source $srchSuiteLocation$includeName

keywordValue=$2
replaceValue=$3

replaceValue=$(echo $replaceValue|sed 's/\(\/\|\\\|&\)/\\&/g')
replaceValue=$(echo $replaceValue|sed 's/\$/\\\$/g')
replaceValue=$(echo $replaceValue|sed 's/\//\\\//g')
replaceValue=$(echo $replaceValue|sed "s/\'/\\\'/g")

keywordValue=$(echo $keywordValue|sed 's!\([]\*\$\/&[]\)!\\\1!g')
keywordValue=$(echo $keywordValue|sed "s/\'/\\\'/g")

# there is still a known issue with single quotes


dspReplaceValue=$(echo $replaceValue|sed "s/\\n/\\\\n/g")

# warning prompt
read -p "So, are we doing this -> 's/$searchValue/$dspReplaceValue/g'  ? (y/n) > "

if [ "$REPLY" != "y" ] && [ "$REPLY" != "Y" ]; then
	echo -e "terminated"
	exit 1
fi


echo -e ">> $grepPath -lrZ $extraSettings \"$searchValue\" $projectSitePath$projectRoot | xargs -0 -L 1 $gsedPath -i -e 's/$keywordValue/$replaceValue/g'"
$grepPath -lrZ $extraSettings "$searchValue" $projectSitePath$projectRoot | xargs -0 -L 1 $gsedPath -i -e 's/'"$keywordValue"'/'"$replaceValue"'/g'
	
echo -e "<< end"


