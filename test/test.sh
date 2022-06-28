#!/bin/bash
nvim -u <(cat << VIMRC
  filetype off
  filetype plugin indent on
  syntax enable
  let g:template_paths = ['./templates']
  set rtp+=.
VIMRC
) /tmp/no_exist.py
