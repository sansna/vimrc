set nocompatible
filetype off

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#rc('$VIM/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bufexplorer.zip'
Plugin 'Lokaltog/vim-powerline'
Plugin 'wesleyche/SrcExpl'
Plugin 'junegunn/limelight.vim'
Plugin 'sickill/vim-pasta'
Plugin 'scrooloose/syntastic'
Plugin 'xuhdev/SingleCompile'
Plugin 'Valloric/YouCompleteMe', {'do':'./install.py'}
Plugin 'chriskempson/base16-vim'

let c_cpp_comments=0

filetype plugin indent on

noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

syntax on
filetype on
filetype plugin on
filetype plugin indent on
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_global_ycm_extra_conf = 'E:/vim64/vimfiles/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set t_Co=256
set backspace=2
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set foldenable
set foldmethod=indent
set autoread
set ignorecase
set smartcase

imap <c-k> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>

set nu
set laststatus=2
set cmdheight=2
set cursorline
set nowrap
colorscheme base16-tomorrow
set shortmess=atI
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set encoding=utf-8
set fenc=utf-8
set fileencodings=utf-8,latin-1,ascii,gbk,usc-bom,cp936,Shift-JIS
set ff=unix
set fileformats=unix,dos,mac

language messages zh_CN.utf-8

nnoremap <c-s> :w<CR>
nnoremap <c-c> ESC
nnoremap <c-c> :nohl<CR>
nnoremap <c-F9> :SCCompile<CR>
nnoremap <c-F10> :SCCompileRun<CR>
nnoremap <c-F11> :SCChooseCompiler<CR>
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re!\w+'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
autocmd InsertLeave * :pclose