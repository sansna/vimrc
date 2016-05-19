set nocompatible					"needed by Vundle.vim
filetype off						"needed by Vundle.vim, after initialization of vundle, this value can be changed by filetype plugin on

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/		"set CWD for Vundle.vim Plugin
call vundle#rc('$VIM/vimfiles/bundle/')			"set CWD for all other Plugins

Plugin 'VundleVim/Vundle.vim'				"Manage plugins
Plugin 'jiangmiao/auto-pairs'				"pairs {}/()/[]/""/''
Plugin 'bufexplorer.zip'					"view tabs by <leader>be,bv,bs
Plugin 'Lokaltog/vim-powerline'				"powerful status line
Plugin 'wesleyche/SrcExpl'				"not frequently used, source insight like
Plugin 'junegunn/limelight.vim'				"to be more focused
Plugin 'sickill/vim-pasta'					"paste things beautifully with p
Plugin 'scrooloose/syntastic'				"check syntastic of c/c++, before compile
Plugin 'xuhdev/SingleCompile'				"compile, run with one key press
Plugin 'Valloric/YouCompleteMe', {'do':'./install.py'}	" auto completion
Plugin 'chriskempson/base16-vim'			"color scheme of vim
Plugin 'scrooloose/nerdtree'				"filesystem explorer

noremap <c-k> <c-w>k				"split windows inter-switch
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

syntax on						"let vim color the code
filetype on						"let vim check file type by ext.
filetype plugin on					"automatically detects file type using filetype plugin, and use plugin supported for this file type
filetype plugin indent on				"turns on filetype detection, and sets different tab settings after detection done
let g:ycm_auto_trigger = 1				"let ycm trigger automatically
let g:ycm_min_num_of_chars_for_completion = 2		"set ycm to start completion with at least 2 letters
let g:ycm_global_ycm_extra_conf = 'E:/vim64/vimfiles/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  "this should be specified after succesfully compiled ycm
set t_Co=256						"sets terminal color
set backspace=2					"enable backspace
set smartindent						"indentation
set expandtab						"tab replaced by spaces, if need to change all the previously entered tabs to spaces, :retab might help
set tabstop=4						"defines how many spaces are inserted if press one tab
set shiftwidth=4					"number of spaces used when indentation occurs
set showtabline=0 					"This turns off the tab line even when there are plural tabs in a single window.
"set smarttab						"if at the line start, tab is interpreted as shiftwidth, otherwise tabstop
set foldenable						"open file with its content folded
set foldmethod=indent					"set the way file is folded
set autoread						"file changed if run, it will be reloaded in vim
set ignorecase						"ignore cases when using / to find strings
set smartcase						"ignore cases when no upper case
autocmd InsertLeave * :pclose				"leaving insert mode will trigger a :pclose which closes scratch window
autocmd InsertLeave * :Limelight!			"leaving insert mode will trigger
autocmd InsertEnter * :Limelight				"entering insert mode will trigger
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 79 . 'v.\+', -1)

imap <c-k> <Up>					"insert mode ctrl+k means moving cursor up
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>

set nu							"show line number
set laststatus=2						"last status height set to 2
set cmdheight=2					"if cmdheight is gt 2, messages will be displayed on last line
set cursorline						"highlight the whole line where cursor is
set nowrap						"show long line in one line, if want to show in multiple lines, set wrap
colorscheme base16-tomorrow				"color scheme
set shortmess=atI					"disable welcome screen
set guioptions-=m					"disable menu
set guioptions-=T					"disable tools
set guioptions-=r					"disable scroll bar
set guioptions-=L					"disable .. not sure
set encoding=utf-8					"set vim encoding in utf-8
set fenc=utf-8						"set file encoding in utf-8
set fileencodings=utf-8,latin-1,ascii,gbk,usc-bom,cp936,Shift-JIS	"set several file encodings to be supported
set ff=unix						"set file format, it affects \n
set fileformats=unix,dos,mac				"set file format it supports
source $VIMRUNTIME/delmenu.vim			"things needed to clear welcome screen
source $VIMRUNTIME/menu.vim			"things needed to clear welcome screen
language messages zh_CN.utf-8				"status bar and more, infos are able to be displayed in zh_CN

nnoremap <c-s> :w<CR>				"shortcut for save
nnoremap <c-c> ESC					"shortcut for esc
nnoremap <c-c> :nohl<CR>:pclose<CR>		"shortcut for no-high-light & close scratch [ Plugin.YCM ]

nnoremap <c-F9> :SCCompile<CR>			"shortcut for compilation
nnoremap <c-F10> :SCCompileRun<CR>		"shortcut for running
nnoremap <c-F11> :SCChooseCompiler<CR>		"shortcut for changing compiler
let g:ycm_min_num_identifier_candidate_chars = 2	"ycm identifier at least requires 2 letters
let g:ycm_semantic_triggers =  {
  \ 'python':['re!\w+'],
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
  \ }							"ycm conditions for completion according to different languages
let mapleader=","					"define <leader> as ','
nnoremap <leader>l :Limelight<CR>			"turn limelight on
nnoremap <leader>cl :Limelight!<CR>			"turn limelight off
nnoremap <leader>v :68vs<CR>
nnoremap <leader>s :15sp<CR>
nnoremap <leader>n :NERDTree<CR>			"open nerdtree explorer
nnoremap <leader>r :vertical resize 68<CR>		"resizes split window