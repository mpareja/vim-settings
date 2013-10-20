# Vim Settings

This configuration repository is used on Ubuntu machines and on Windows machines for Vim and GVim.

## Credits

Some of the configuration was originally based on Topfunky's Vim starter with some tweaks by Rob Conery. Check out Topfunky's PeepCode episodes on Vim. It has changed very much over time and I've added basic installation scripts.

## Installation

The setup procedures differ for Linux and Windows.

### Linux

Clone this repository and run the install script:

    git clone https://github.com/mpareja/vim-settings.git ~/.vim
    cd ~/.vim && ./install.sh

The default font is Consolas, so you may want to install the `Consola.ttf` font by double clicking on it and choosing to install.

### Windows

In Windows the instructions are a bit lengthier:

  1. Clone this repository somewhere on your hard drive. 
  2. Backup your .vimrc and .gvimrc files.
  3. From Git bash, execute `./install.sh` in the newly cloned directory.
  4. Open up the vimfiles directory (its location depends on your installation of Vim) and remove everything.
  5. Copy all of the directories in the repo and paste them in the vimfiles directory.
  6. Re-run `./install.sh` (it performs some commands that expect the vimfiles to already be in the correct location).

## Updating bundles

Use the following script to update all submodules. Make sure to commit them separately so you can back out changes easily.

  git submodule foreach "(git checkout master; git pull)&"
  Open up vim and enter the following command to update help: call pathogen#helptags()
