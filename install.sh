#!/bin/bash
set -e
test -f ~/.vimrc || ln -s .vim/vimrc ~/.vimrc
test -f ~/.gvimrc || ln -s .vim/gvimrc ~/.gvimrc
