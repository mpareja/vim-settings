#!/bin/bash

git submodule foreach "(git checkout master; git pull)&"

if [ ! -e /c ]; then
	# not windows
	echo Compiling vimproc module
	cd bundle/Shougo-vimproc
	make
fi


vim -c "call pathogen#helptags() | q"
