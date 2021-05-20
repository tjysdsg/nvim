set termguicolors

set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set shiftround
set showmatch
set laststatus=2
set title
set ruler
set softtabstop=4
set smarttab
set number
set nowrap
set hlsearch
" save history
set history=1000
set undolevels=1000
set wildignore=*.swp,*.pyc
set visualbell
set noerrorbells
set undofile
set undodir=~/.vim/undodir
" no swapfile or backup cuz I've got git
set nobackup
set noswapfile

" show current cursor line and column
set cursorcolumn
set cursorline

" faster reaction
set ttyfast
" syntax highlight
syntax on
filetype indent on
filetype on
filetype plugin on
" fold using syntax
set foldmethod=syntax

" timeout for better leader-key
set timeout           " for mappings
set timeoutlen=500   " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value

" keymaps
let mapleader = ','
" real delete (not cut)
nnoremap <leader>x "_d
xnoremap <leader>x "_d

" save file with <leader>+s
nnoremap <leader>s :w<enter>

" switching between tabs using <leader>+a and d
nnoremap <leader>d :bnext<enter>
nnoremap <leader>a :bNext<enter>

" save as root using <leader>+shift+s
nnoremap <leader>S :w !sudo tee %<enter>

" source vimrc using <leader>+v
nnoremap <leader>v :source $MYVIMRC<cr>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" turn hybrid line numbers on
set number relativenumber
set nu rnu

set t_Co=256

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data'))

Plug 'mcchrish/nnn.vim'

Plug 'overcache/NeoSolarized'

call plug#end()

" ==================== nnn settings ====================
" Disable default mappings
let g:nnn#set_default_mappings = 0
" <leader>+nn to open nnn
nnoremap <silent> <leader>nn :NnnPicker<CR>
let g:nnn#layout = { 'left': '~20%' } " or right, up, down

" ==================== color scheme ====================
colorscheme NeoSolarized
set background=dark
