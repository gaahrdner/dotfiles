" Author: <@gaahrdner>
" Version: 0.0.3

" required for vundle
set nocompatible                  " disable vi compatibility
filetype off 

"Vundle bootstrap
if !filereadable($HOME . '/.vim/bundle/Vundle.vim/.git/config') && confirm("Clone Vundle?","Y\nn") == 1
    exec '!git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim'
endif

" set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'

Plugin 'honza/vim-snippets'
Plugin 'valloric/youcompleteme'

Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'fatih/vim-go'
Plugin 'rodjek/vim-puppet.git'
Plugin 'pearofducks/ansible-vim'
Plugin 'klen/python-mode'
Plugin 'nginx.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'


filetype plugin indent on         " Automatically detect file types, must be turned on after vundle
syntax enable                     " Enable syntax highlighting
try
  set background=dark
  colorscheme solarized
catch
endtry

set history=10000                 " size of the history buffer
set pastetoggle=<F2>              " Set pastetoggle so we don't get auto indenting when pasting in a shit ton of text
set autoread                      " reread the file if it was changed outside of vim
set notimeout                     " don't timeout on mappings
set ttimeout                      " timeout on terminal key codes
set timeoutlen=100                " timeout after 100 ms

set foldmethod=syntax             " fold based on code syntax
set foldnestmax=10                " deepest fold is 10 levels
set nofoldenable                  " don't fold by default
set foldlevel=1

autocmd FileType ruby compiler ruby " Set the compilre to ruby for .rb files 

set incsearch                     " show search matches as you type
set hlsearch                      " highlight search results
set ignorecase                    " case insensitive searches
set smartcase                     " ignore case if search pattern is lower case, otherwise it is case sensitive
set showmatch                     " show matches in parens

set undodir=~/.vim/undo           " undo files
set backupdir=~/.vim/backups      " backups
set directory=~/.vim/swap         " swap files
set backup 
set noswapfile 

set autoindent                    " always set autoindenting on
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " and so is the autoindent
set softtabstop=2                 " backspace treats 2 spaces like a tab
set expandtab                     " insert space characters instead of tabs
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'

set textwidth=80                  " wrap at 80 characters
set wrap                          " wrap lines at 80 chars
set formatoptions=qrn1            "
try
  set colorcolumn=+1                " color column 81, so I know if a line is too long
catch
endtry
