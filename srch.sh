#!/bin/bash
# srch - grep values for given project with a settings file for each project + mdfind

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



searchValue=$2
#grep based escape
searchValue=$(echo $searchValue|sed 's!\([]\*\$\/&[]\)!\\\1!g')
#searchValue=$(echo $searchValue|sed 's/\(\.\|\/\|\*\|\[\|\]\|\\\)/\\&/g')
#searchValue=$(echo $searchValue|sed 's/\$/\\\$/g')

# this might be good as a recursive function - ala .gitignore
extraSettings=""
if [ -e "$projectSitePath$projectRoot/.srch" ]; then
	extraSettings=$(cat $projectSitePath$projectRoot/.srch)
fi

echo -e ">> $grepPath -irn --color=always $extraSettings \"$searchValue\" $projectSitePath$projectRoot"

$grepPath -irn --color=always $extraSettings "$searchValue" $projectSitePath$projectRoot
	

if [ -e "${doFindage+x}" ]; then # no findage is to stop find or mdfind search - used with replace.
	doFindage=1
	echo -e "here"
fi

if [ ! -n "$doFindage" ]; then
	includeName="frch.sh"
	source $srchSuiteLocation$includeName
fi

echo -e "<< end srch results"


