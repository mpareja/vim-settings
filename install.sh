#!/bin/bash

git submodule init && git submodule update

# Update tern
pushd bundle/marijnh-tern_for_vim
npm install
popd

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

	echo Linking .vimrc and .gvimrc
	[ -e ~/.vimrc ] || ln -s $VimRepo/vimrc ~/.vimrc
	[ -e ~/.gvimrc ] || ln -s $VimRepo/gvimrc ~/.gvimrc

	which ctags
	if [ $? -ne 0 ]; then
		echo Installing Exuberant Tags.
		sudo apt-get install exuberant-ctags
	else
		echo Verified Exuberant Tags is already installed.
	fi

	mkdir -p $HOME/.vim/tmp

	echo Installing Consola font
	mkdir -p $HOME/.fonts
	cp Consola.ttf $HOME/.fonts/

	echo Compiling vimproc module
	cd bundle/Shougo-vimproc
	make

	if ! hash ag; then
		echo "The file search configuration assumes ag is installed."
		read -n 1 -p 'Install silversearcher-ag file finder (Y/n)? ' CONFIRM
		[ "$CONFIRM" = 'n' ] || sudo apt-get install -y silversearcher-ag
	fi
fi

vim -c "call pathogen#helptags() | q"
