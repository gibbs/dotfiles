if (has("termguicolors"))
  set termguicolors
endif

call plug#begin('~/.vim/plugged')

  Plug 'terryma/vim-multiple-cursors'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'mattn/emmet-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'rakr/vim-one'
  Plug 'majutsushi/tagbar'
  Plug 'flazz/vim-colorschemes'
  Plug 'Yggdroot/indentLine'
  Plug 'severin-lemaignan/vim-minimap'
  Plug 'dracula/vim'
  Plug 'kaicataldo/material.vim'
  Plug 'liuchengxu/space-vim-theme'
  Plug 'SolomonSklash/vim-snazzy'
  Plug 'ErichDonGubler/vim-sublime-monokai'
  Plug 'tjammer/blayu.vim'
  Plug 'haishanh/night-owl.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ap/vim-css-color'

" Initialize plugin system
call plug#end()

colorscheme spacegray
set background=dark
syntax enable
set number
set syntax=whitespace
set redrawtime=10000

highlight ColorColumn ctermbg=1 guibg=grey15
let &colorcolumn="80,120"

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set noeol
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list
set runtimepath^=~/.vim/bundle/ctrlp.vim
set cursorline

nnoremap <c-s> :w<CR> # normal mode: save
inoremap <c-s> <Esc>:w<CR>l # insert mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR> # visual mode: escape to normal and save

nmap <F8> :TagbarToggle<CR>
map <C-o> :NERDTreeToggle<CR>

let g:user_emmet_leader_key=','
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|web/node_modules'
