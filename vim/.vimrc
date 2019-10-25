if (has("termguicolors"))
  set termguicolors
endif

" Plugins
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
  Plug 'shmargum/vim-sass-colors'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'rodjek/vim-puppet'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'pablopunk/native-sidebar.vim'
  Plug 'wincent/terminus'
  Plug 'tobyS/pdv'
  Plug 'bronson/vim-crosshairs'
  Plug 'ericbn/vim-relativize'

  " PHP
  Plug '2072/PHP-Indenting-for-VIm'

" Initialize plugin system
call plug#end()

colorscheme one
set background=dark
set relativenumber
syntax enable
set number
set syntax=whitespace
set redrawtime=10000

hi Normal guibg=NONE ctermbg=NONE
highlight ColorColumn ctermbg=1 guibg=#2c323c
let &colorcolumn="80,120"

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set noeol
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list
set lcs+=space:·
set runtimepath^=~/.vim/bundle/ctrlp.vim
set cursorline
set cursorcolumn
set autoindent

nnoremap <c-s> :w<CR> # normal mode: save
inoremap <c-s> <Esc>:w<CR>l # insert mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR> # visual mode: escape to normal and save

nmap <F8> :TagbarToggle<CR>
map <C-o> :NERDTreeToggle<CR>

" plugin key bindings
let g:native_sidebar_shortcut = '<c-t>'

let g:user_emmet_leader_key=','
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|web/node_modules\|modules'
let g:tagbar_width = 40
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
