# VIMP Tool Suite

A basic tool set to complement vim. Currently designed around OS X.

###vimp  

- open vim (line number syntax optional)
- show name of file in tab (using alternative method to changing your .vimrc file)
- example: vimp file.txt:13

###mimp

- same as vimp but for MacVim and opens in a new tab
- example: mimp file.txt:13

###frch

- return list of file matching criteria
- config files can be used to limit searchable files
- example: frch my_project file.txt 
- example 2: frch . file_part

###srch

- return simplified grep search results based on project name
- config files can be used to limit searchable files
- example: srch my_project "text in file"

###rplace

- basic search and replace using srch as it's base
- example: rplace my_project "text in file" "replacement text for file"
- NOTE: still some issues to handle


##Installation

The files are basic bash shell scripts.

Clone down the script set:

	git clone git@github.com:xmcgyver/vimp_tool_suite.git vimp_tool_suite
	cd vimp_tool_suite

Ensure files are executable:

	sudo chmod -R 755 . 

Some dependancies need to be taken care of too with homebrew:

	sudo brew install gnu-sed # this is for rplace
	sudo brew install grep # this is for exluding directories in srch

Set the files up to work in terminal - there are a number of ways but this the most global approach - you might need a sudo in front of each of the following commands. (note the ` is the character on the key with the ~, it is not a single quote!)

	ln -s `pwd`/vimp.sh /usr/local/bin/vimp
	ln -s `pwd`/mimp.sh /usr/local/bin/mimp
	ln -s `pwd`/frch.sh /usr/local/bin/frch
	ln -s `pwd`/srch.sh /usr/local/bin/srch
	ln -s `pwd`/rplace.sh /usr/local/bin/rplace

Create the config:

	mkdir ~/.srch
	vi ~/.srch/config

The config file should have some content like that found in config_example file found in the vimp_tool_suite dir

Add the folder with mvim to your $PATH

        export PATH=$PATH:/Applications/macvim

As a final point, if you want to add default options onto to the grep handling such as excluding dirs then, depending on your version of grep, you can add a file called .srch into the base of you project (like ~/Sites/my_project/.srch) and add in something like this.

	--exclude=*.svn* --exclude=*.swp --exclude-dir=\.git 

## How do I know it worked?

If you are in your project folder, you should be able to run something like
        
        srch . "test"

and it will return a listing of files that contain the string "test"

## Notes

This is a very rough implementation and corrections and pushes are welcome.

## Copyright 

&copy; Flickspin Media Pty Ltd.


## Licencing

MIT/BSD

see LICENCE file

