.PHONY: install_vim install_pathogen install_fonts

default: install_pathogen install_vim install_fonts

install_pathogen:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

install_vim:
	cp ./.vimrc ~
	cp -r ./.vim/bundle ~/.vim/

install_fonts:
	sudo cp -r ./fonts/* /usr/share/fonts/
	fc-cache -vf
