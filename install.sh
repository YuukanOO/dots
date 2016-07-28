#!/bin/bash

# Global variables
RED='\033[0;31m'
GREEN='\033[0;32m'
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

echo "This script will do all required steps do deploy a ready to use environment based on this dots repo. Do you want to run it now? [Y/n]"
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

if ! [ $PREREQ_OK -eq 1 ];then
	echo -e "${RED}Some prerequistes are missing, please install them first! Exiting now...${NC}"
	exit
fi

#echo "You will need rxvt-unicode with --enable-unicode3!\nIf it complains about perl not available, install the package perl-ExtUtils-Embed. You may also need libX11-devel."

# Retrieve submodules
echo "Retrieving git submodules..."
git submodule init
git submodule update

# Fonts
curl -LSso $DIR/tmp/tamsyn-font.tar.gz http://www.fial.com/~scott/tamsyn-font/download/tamsyn-font-1.11.tar.gz
tar xzf $DIR/tmp/tamsyn-font.tar.gz -C $DIR/tmp
mkdir -p $HOME/.local/share/fonts/tamsyn
cp $DIR/tmp/tamsyn-font-1.11/* $HOME/.local/share/fonts/tamsyn
mkfontdir $HOME/.local/share/fonts/tamsyn
sh $DIR/fonts/install.sh

# ZSH
echo "Installing Oh my zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

# Terminal stuff
echo "Installing terminal stuff..."
cp -R $DIR/base16-shell $HOME/.config
cp $DIR/.bashrc $HOME
cp $DIR/.Xresources $HOME
source $HOME/.bashrc
xrdb -merge $HOME/.Xresources
cat $DIR/.zshrc >> $HOME/.zshrc

# VIM
echo "Preparing VIM..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp $DIR/.vimrc $HOME
cp -R $DIR/.vim $HOME

# Awesome WM
echo "Copying awesome environment..."
mkdir -p $HOME/.config
cp -R $DIR/.config/awesome $HOME/.config
