.PHONY: install_vim install_pathogen

default: install_pathogen install_vim

install_pathogen:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

install_vim:
	cp ./.vimrc ~
