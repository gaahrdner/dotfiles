{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = { 
      history = 1000;
      ignorecase = true;
      shiftwidth = 2;
      smartcase = true;
      tabstop = 2;
    };
    extraConfig = ''
      set nocompatible
      filetype off

      filetype plugin indent on
      syntax enable
      try
        set background=dark
        colorscheme solarized
      catch
      endtry

      set backspace=indent,eol,start
      set autoread
      set notimeout
      set ttimeout
      set timeoutlen=100

      set foldmethod=syntax
      set foldnestmax=10
      set nofoldenable
      set foldlevel=1

      set incsearch
      set hlsearch
      set showmatch

      set autoindent
      set softtabstop=2
      set expandtab
      set shiftround

      set textwidth=80
      set wrap
      set formatoptions=qrn1

      try
        set colorcolumn=+1
      catch
      endtry
    '';
  };
}
