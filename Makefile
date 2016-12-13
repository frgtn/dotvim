.PHONY: all
all: vim-plug


.PHONY: help
help:
	@echo 'make all     - fetch all bundles and compile after a fresh checkout'
	@echo 'make install - install missing bundles'
	@echo "make update  - update all bundles (doesn't recompile)"


.PHONY: install
install bundle/command-t: vim-plug
	vim +PlugInstall


.PHONY: update
update: vim-plug
	vim +PlugUpdate


.PHONY: vim-plug
vim-plug: autoload/plug.vim
autoload/plug.vim:
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
