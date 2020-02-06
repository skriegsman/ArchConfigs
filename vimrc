"-------------------------------------------------------------------------------------------------------------"
"
"					            ██
"					           ░░
"					 ██    ██   ██   ██████████
"					░██   ░██  ░██  ░░██░░██░░██
"					░░██ ░██   ░██   ░██ ░██ ░██
"					 ░░████    ░██   ░██ ░██ ░██
"					  ░░██     ░██   ███ ░██ ░██
"					   ░░      ░░   ░░░  ░░  ░░
"
"-------------------------------------------------------------------------------------------------------------"
"poop
" This block sets the mapleader character to the comman, see this link to explain what this means
" More Info At: https://learnvimscriptthehardway.stevelosh.com/chapters/06.html
	let mapleader =","

" This following line loads python for nvim
	let g:python3_host_prog = '/usr/bin/python3'
	let g:python_host_prog = '/usr/bin/python2'

" plugins listed from their location in the ~/.config/nvim/plugged
" More Info At: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
	if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
		echo "Downloading junegunn/vim-plug to manage plugins..."
		silent !mkdir -p ~/.config/nvim/autoload/
		silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	endif

	call plug#begin('~/.config/nvim/plugged')
	Plug 'tpope/vim-surround'		" Shortcuts for using quotes, brackets, parentheses, etc
	Plug 'scrooloose/nerdtree'		" File system explorer for vim
	Plug 'PotatoesMaster/i3-vim-syntax' 	" Adds syntax highlighting for the i3 config file
	Plug 'bling/vim-airline'		" Statusbar and tabline for vim, much cleaner
	Plug 'vifm/vifm.vim'			" A vim file manager
	"Plug 'ajh17/vimcompletesme'		" Makes vims built in autocomplete easier to use
	Plug 'shougo/deoplete.nvim'
	Plug 'floobits/floobits-neovim'		" Cross platform Teletype
	Plug 'junegunn/rainbow_parentheses.vim'	" Color codes nested brackets, etc.
	Plug 'chun-yang/auto-pairs'		" Auto adds the completing bracket
	Plug 'scrooloose/nerdcommenter'		" Adds shortcuts to comment code
	Plug 'tpope/vim-fugitive'		" Git commands in vim
	Plug 'severin-lemaignan/vim-minimap'	" MINIMAP!!!! Just like atom!
	call plug#end()

" The following block sets some of the basic settings light the mouse, background, clipboard, and gui options
	set bg=light
	set go=a
	set mouse=a
	set nohlsearch
	set clipboard=unnamedplus

	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number

	set hlsearch
	set smartcase

" Auto start the rainbow parentheses on start
	autocmd VimEnter * :RainbowParentheses

" Use deoplete.
	let g:deoplete#enable_at_startup = 1

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
	set splitbelow splitright

" Nerd tree --> use ,n to toggle
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Check file in shellcheck --> use ,s to activate
	map <leader>s :!clear && shellcheck %<CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
