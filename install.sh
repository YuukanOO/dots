#!/bin/bash

# Global variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PREREQ_OK_STRING="${GREEN}OK${NC}"
PREREQ_KO_STRING="${RED}Missing${NC}"
PREREQ_OK=1

function checkCmd {
	printf "Checking ${1}..."
	if ! [ -x "$(command -v ${1})" ];then
		PREREQ_OK=0
		echo -e $PREREQ_KO_STRING
	else
		echo -e $PREREQ_OK_STRING
	fi
}

echo "This script will do all required steps do deploy a ready to use environment based on this dots repo. It may override your current dot files so make a backup!! Do you want to run it now? [Y/n]"
read GOON

if [ ${GOON:-Y}  = "n" ];then
	echo "Exiting..."
	exit
fi

# Check available packages
echo "Checking prerequiste..."

checkCmd zsh
checkCmd awesome
checkCmd urxvt
checkCmd vim
checkCmd ruby
checkCmd chsh
checkCmd mkfontdir
checkCmd compton
checkCmd firefox
checkCmd sed
checkCmd wc
checkCmd dnf
checkCmd nmcli
checkCmd feh

if ! [ $PREREQ_OK -eq 1 ];then
	echo -e "${RED}Some prerequistes are missing, please install them first! Exiting now...${NC}"
	exit
fi

echo -e "${YELLOW}Embedded jumanji config files works best for the git version so you may have to compile it from source.${NC}"

# Retrieve submodules
echo "Retrieving git submodules..."
git submodule init
git submodule update

# Fonts
if [ ! -f $DIR/tmp/tamsyn-font.tar.gz ];then
  curl -LSso $DIR/tmp/tamsyn-font.tar.gz http://www.fial.com/~scott/tamsyn-font/download/tamsyn-font-1.11.tar.gz
  tar xzf $DIR/tmp/tamsyn-font.tar.gz -C $DIR/tmp
  mkdir -p $HOME/.local/share/fonts/tamsyn
  cp $DIR/tmp/tamsyn-font-1.11/* $HOME/.local/share/fonts/tamsyn
  mkfontdir $HOME/.local/share/fonts/tamsyn
fi
curl -LSso $HOME/.local/share/fonts/Icons.bdf https://raw.githubusercontent.com/copycat-killer/dots/master/.fonts/Icons.bdf
sh $DIR/fonts/install.sh

# ZSH
echo "Installing Oh my zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

# Terminal stuff
mkdir -p $HOME/.config
echo "Installing terminal stuff..."
cp -R $DIR/.irssi $HOME/.irssi
cp -R $DIR/base16-shell $HOME/.config
cp $DIR/.bashrc $HOME
cp $DIR/.Xresources $HOME
cp $DIR/.xsession $HOME
cp $DIR/.profile $HOME
cp $DIR/.zshrc $HOME/.zshrc

# VIM
echo "Preparing VIM..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp $DIR/.vimrc $HOME
cp -R $DIR/.vim $HOME
mkdir $HOME/.vim/colors
cp $DIR/base16-vim/colors/* $HOME/.vim/colors

# Awesome WM
echo "Copying awesome environment..."
cp -R $DIR/.config/* $HOME/.config

xrdb -merge $HOME/.Xresources
source $HOME/.bashrc
source $HOME/.profile
