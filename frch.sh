#!/bin/bash
# frch - find <-> search

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


if [ -e "${mdFindage+x}" ]; then
	mdFindage=0
fi


if [ -n "$mdFindage" ]; then
	echo -e ">> mdfind -iname \"$2\" -onlyin $projectSitePath$projectRoot"
	mdfind -name "$2" -onlyin $projectSitePath$projectRoot
else
	echo -e ">>  find $projectSitePath$projectRoot -iname \"*$2*\""
	find $projectSitePath$projectRoot -iname "*$2*"
fi


