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
" set foldmethod=syntax


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

Plug 'preservim/nerdtree'

Plug 'ishan9299/nvim-solarized-lua'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'romgrk/barbar.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ==================== nerdtree settings ====================
" nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" ==================== color scheme ====================
colorscheme solarized-high
set background=dark

" ==================== treesitter ====================
" highlighting
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

" incremental selection
lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
" folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" ==================== barber ====================
" " Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
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

let bufferline = get(g:, 'bufferline', {})
" disable animations
let bufferline.animation = v:false
" disable icons
let bufferline.icons = v:false

" ==================== gitsigns ====================
lua require('gitsigns').setup()

