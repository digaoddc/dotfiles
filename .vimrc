set nocompatible              " be iMproved, required
filetype off


" =============== Plugins configurations ===================
nmap <silent> <Leader>p :NERDTreeToggle<CR>

" fugitive.vim
" "
" ---------------------------------------------------------------------------------------------------------------------
"
"  " open an interactive vertical split with git blame
nnoremap <silent> <leader>gb :Gblame<CR>
"
"  " open the output of git diff
nnoremap <silent> <leader>gd :Gdiff<CR>
"
"  " open the output of git status
nnoremap <silent> <leader>gs :Gstatus<CR>
"


" EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <silent> df :Ag "<cword>" <CR>
"nnoremap <leader>. :CtrlPTag<cr>
let g:airline#extensions#tabline#enabled = 1

" Buffer mappings
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>


" Make copy commands work with SO clipboard
set clipboard=unnamed

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v\c(node_modules|_build|deps|vendor|\.git|\.svn)$',
    \ 'file': '\v\c\.(swf|bak|png|gif|mov|ico|jpg|pdf|jrxml)$',
    \}

" ==========================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-endwise'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'elixir-lang/vim-elixir'
Plugin 'craigemery/vim-autotag'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Turn on syntax highlighting
syntax on

set number

" Indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
