#!/bin/bash
set -e

if [ -e /c ]; then
	# windows
	VimRepo=$(cmd //C cd)
	echo Pointing ~/_vimrc at $VimRepo/vimrc
	echo "so $VimRepo\\vimrc" > ~/_vimrc

	echo Pointing ~/_gvimrc at $VimRepo/gvimrc
	echo "so $VimRepo\\gvimrc" > ~/_gvimrc

	mkdir -p $HOME/_vim/tmp
else
	VimRepo=$(pwd)
	# linux
	echo Install not yet scripted for linux.
fi
