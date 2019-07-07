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
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'w0rp/ale'
  Plug 'zoeesilcock/vim-caniuse'
  Plug 'scrooloose/nerdcommenter'
  Plug 'rodjek/vim-puppet'

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
set autoindent

nnoremap <c-s> :w<CR> # normal mode: save
inoremap <c-s> <Esc>:w<CR>l # insert mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR> # visual mode: escape to normal and save

nmap <F8> :TagbarToggle<CR>
map <C-o> :NERDTreeToggle<CR>

let g:user_emmet_leader_key=','
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|web/node_modules\|modules'

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
