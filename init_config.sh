#!/bin/bash
# init_config - this is included by scripts in the suite for preping the config settings

# flag to say this has been included
isConfigIncluded=1

if [ ! -n "${grepPath+x}" ]
then
	grepPath=$(which grep)
fi

if [ ! -n "${gsedPath+x}" ]
then
	gsedPath=$(which gsed)
fi

projectRoot=${1%%/*}
projectSitePath="" 

if [ -e "${projectLocation+x}" ]
then
	echo -e "Fail: errz 002 -> variable not defined in config: Array \$projectLocation"
	exit 1
fi

if [ "$projectRoot" != "." ]
then
	for name in ${projectLocation[@]}
	do
		if [ -e "$name$projectRoot" ]
		then
			projectSitePath="$name"
		fi
	done

	if [ ! -n "$projectSitePath" ]
	then
		echo "Fail: errz 003 -> Missing project: \"$projectRoot\" - $projectSitePath"
		exit 1
	fi
else
	projectRoot="$PWD"
fi




