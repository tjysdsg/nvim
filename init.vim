set nocompatible

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
set mouse-=a

" no swapfile or backup
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
" set foldmethod=syntax


" timeout for better leader-key
set timeout           " for mappings
set timeoutlen=500   " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value

" leader key is space
let mapleader = " "

" save as root using <leader>+shift+s
nnoremap <leader>S :w !sudo tee %<enter>

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

let g:solarized_italics = v:false

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data'))

" file tree
Plug 'preservim/nerdtree'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" tabbar
" TODO: barber is broken for now
" Plug 'romgrk/barbar.nvim'

" git diff
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" doc generation
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" lanugage pack
Plug 'sheerun/vim-polyglot'

call plug#end()

" ==================== nerdtree settings ====================
" nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" ==================== color scheme ====================
" colorscheme solarized-high
set background=dark
set termguicolors
" ==================== barber ====================
" " Move to previous/next
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-w> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
    " nnoremap <silent> <C-s>    :BufferPick<CR>

" TODO: barber is broken for now
" let g:barbar_auto_setup = v:false " disable auto-setup
" lua << EOF
" require'barbar'.setup {
"   animation = true,
"   icons = { filetype = { enabled = false } },
" }
" EOF


" switching between tabs using <leader>+. and ,
nnoremap <leader>.  :bnext<enter>
nnoremap <leader>,  :bNext<enter>

