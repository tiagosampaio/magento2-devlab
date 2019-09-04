#!/usr/bin/env sh

apt-get install -y \
  vim \
  && echo "syntax on" >> ~/.vimrc \
  && echo "filetype plugin indent on" >> ~/.vimrc \
  && echo "set number" >> ~/.vimrc \
  && echo "set laststatus=2" >> ~/.vimrc \
  && echo "set ruler" >> ~/.vimrc \
  && echo "set term=xterm-256color" >> ~/.vimrc
