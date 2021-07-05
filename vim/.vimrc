" True colour support
if (has("termguicolors"))
  set termguicolors
endif

" Plug Plugin Manager
call plug#begin('~/.vim/plugged')

  Plug 'tpope/vim-pathogen'

  " IDE
  "Plug 'terryma/vim-multiple-cursors'
  "Plug 'Yggdroot/indentLine'
  "Plug 'kien/ctrlp.vim'
  "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  "Plug 'junegunn/fzf.vim'
  "Plug 'bronson/vim-crosshairs'
  "Plug 'pablopunk/native-sidebar.vim'
  "Plug 'wincent/terminus'
  "Plug 'tpope/vim-surround'
  "Plug 'ericbn/vim-relativize'
  "Plug 'sheerun/vim-polyglot'
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  
  " UI
  "Plug 'itchyny/lightline.vim'
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
  "Plug 'majutsushi/tagbar'

  " VCS
  Plug 'editorconfig/editorconfig-vim'
  "Plug 'airblade/vim-gitgutter'
  "Plug 'tpope/vim-fugitive'

  " Themes
  "Plug 'connorholyday/vim-snazzy'
  Plug 'rakr/vim-one'

  " Language Support
  "Plug 'rodjek/vim-puppet'
  "Plug 'shmargum/vim-sass-colors'
  "Plug 'tobyS/pdv'
  "Plug '2072/PHP-Indenting-for-VIm'
  "Plug 'hashivim/vim-terraform'
  "Plug 'vim-syntastic/syntastic'

  " Other
  "Plug 'freitass/todo.txt-vim'

" Initialize plugin system
call plug#end()

" UI Setup
colorscheme one
"set t_Co=256
set background=dark
set relativenumber
syntax enable
set number
set syntax=whitespace
set redrawtime=10000

" Rulers
highlight ColorColumn ctermbg=1 guibg=#0a0a0a
let &colorcolumn="80,120"

" Transparent Background
"highlight Normal guibg=NONE ctermbg=NONE
highlight Normal guibg=#191b20 guifg=white

" Environment
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

" NERDTree
map <C-o> :NERDTreeToggle<CR>

" Sidebar
let g:native_sidebar_shortcut = '<c-t>'

" CTRL P
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|web/node_modules\|modules'

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='one'

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
