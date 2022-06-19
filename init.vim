"{{{ Basic settings
set nocompatible                                            " do not be compatible with vi
filetype plugin indent on                                   " Use color syntax highlighting.
syntax on

set foldmethod=marker                                       " fold the text with "{{{ Description and end with "}}} 1
"set foldmethod=indent                                      " fold the text at indent
set autoindent                                              " copy the indentation from the previous line, when starting a new line
set backspace=2                                             " Allows insert-mode backspace to work as one expects
set fileformat=unix                                         " No crazy CR/LF
set listchars=tab:\ \ ,trail:·                              " If you do ":set list", shows trailing spaces
set mouse=""                                                " Disabled mouse selection so C + S + C/V work
"set nobackup                                               " Don't use a backup file (also see writebackup)
set writebackup                                             " Write temporary backup files in case we crash
set hlsearch                                                " Do highlight search terms
set ignorecase                                              " searches are case insensitive...
set smartcase                                               " ... unless they contain at least one capital letter
set ruler                                                   " Show the line position at the bottom of the window
set scrolloff=10                                            " Minimum lines between cursor and window edge (virtual lines)
set showcmd                                                 " Show partially typed commands
set showmatch                                               " Show parentheses matching
set textwidth=80                                            " Maximum line width
set tabstop=4                                               " The width of a TAB is set to 4. Still it is a \t.
set shiftwidth=4                                            " when indenting with '>', use 4 spaces width
set expandtab                                               " Expand TABs to spaces.
set encoding=utf-8                                          " encoding
set number                                                  " line numbering
set relativenumber                                          " relative line numbering 
"set completeopt=longest,menuone
set spell spelllang=hr,en,cjk                               " dictionary
set spellfile=/home/dbanic/.config/nvim/spell/hr.utf-8.add  " added new words go here
set incsearch                                               " incremental search

" disable python2 for nvim
let g:loaded_python_provider = 0
let g:python_host_prog = ''
let g:python3_host_prog = '/usr/bin/python'

"}}} 1
"{{{ Key remaps

" Leader
" remaps leader key (default \) to space
let mapleader = "\<Space>"
" Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"" toggle indent pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" join lines up
nnoremap K kJ
" use tidy to clean up HTML :Thtml
:command Thtml :%!tidy -q -i --show-errors 0

" Allow saving of files as sudo when I forgot to start vim using sudo. The > /dev/null part explicitly throws away the standard output
cnoremap w!! w !sudo tee > /dev/null %

"}}} 1
"{{{1 Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'gruvbox-community/gruvbox'

" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'

" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'

" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

"airline status bar
Plug 'vim-airline/vim-airline'

" lazygit integration
Plug 'kdheepak/lazygit.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" LaTex plugin umjesto LSP-a koji je užasno spor
Plug 'lervag/vimtex'

" vim surround
Plug 'tpope/vim-surround'

" python stuff
Plug 'davidhalter/jedi-vim'

" Auto closing parens etc
Plug 'jiangmiao/auto-pairs'

" Markdown plugin
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" cht.sh integration
Plug 'Djancyp/cheat-sheet'

call plug#end()

"lua packages
lua require('packages')
"}}}1
"{{{ Plugins configuration
"jiangmiao/auto-pairs
"disables Alt + p toggle
let g:AutoPairsShortcutToggle = ''

" vim-airline powerline settings
let g:powerline_loaded = 1
let g:powerline_pycmd = 'py3'
set laststatus=2

" to use vim-latexsuite
"set grepprg=grep\ -nH\ $*
let g:tex_flavor = "xelatex"
let g:Tex_DefaultTargetFormat = 'pdf'
"}}}1
"{{{ Theme
"set background=dark
"let g:solarized_base16=1
"set background=light
"let g:solarized_termcolors=256
colorscheme gruvbox
set background=dark
"}}} 1
"{{{ Docs
" https://www.jakewiesler.com/blog/getting-started-with-vim
" https://github.com/junegunn/vim-plug
" https://github.com/tpope/vim-surround
" https://github.com/lervag/vimtex
" https://github.com/instant-markdown/vim-instant-markdown
"}}}1
