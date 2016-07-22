echo "This script will do all required steps do deploy a ready to use environment based on this dots repo. Do you want to run it now? [Y/n]"
read GOON

if [ ${GOON:-Y}  = "n" ];then
	echo "Exiting..."
	exit
fi

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Check available packages
echo "Checking prerequiste..."

PREREQ_OK_STRING="${GREEN}OK${NC}"
PREREQ_KO_STRING="${RED}Missing${NC}"
PREREQ_OK=1

printf "Checking ZSH..."
if ! [ -x "$(command -v zsh)" ];then
	PREREQ_OK=0
	echo -e $PREREQ_KO_STRING
else
	echo -e $PREREQ_OK_STRING
fi

if ! [ $PREREQ_OK -eq 1 ];then
	echo -e "${RED}Some prequistes are missing, please install them first! Exiting now...${NC}"
	exit
fi

exit

# ZSH
echo "Installing zsh and Oh my zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
