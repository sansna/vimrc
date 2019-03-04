set nocompatible                    "needed by Vundle.vim
set foldcolumn=0                    "foldcolumn diables by default"
set diffopt=foldcolumn:2            "except for vimdiff mode
filetype off                        "needed by Vundle.vim, after initialization of vundle, this value can be changed by filetype plugin on
set path+=/usr/include
set tags=tags;                              "find the tags recursively upward

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/       "set CWD for Vundle.vim Plugin
call vundle#rc('$VIM/vimfiles/bundle/')     "set CWD for all other Plugins

Plugin 'VundleVim/Vundle.vim'               "Manage plugins
Plugin 'jiangmiao/auto-pairs'               "pairs {}/()/[]/""/''
Plugin 'bufexplorer.zip'                    "view tabs by <leader>be,bv,bs
Plugin 'Lokaltog/vim-powerline'             "powerful status line
Plugin 'wesleyche/SrcExpl'                  "not frequently used, source insight like
Plugin 'junegunn/limelight.vim'             "to be more focused
Plugin 'sickill/vim-pasta'                  "paste things beautifully with p
"Plugin 'vim-syntastic/syntastic'            "statically check syntastic of c/c++, before compile, turn it off while using ycm.
Plugin 'xuhdev/SingleCompile'               "compile, run with one key press
Plugin 'Valloric/YouCompleteMe', {'do':'./install.py'}  " auto completion
Plugin 'chriskempson/base16-vim'            "color scheme of vim. In linux, let's install screen
Plugin 'scrooloose/nerdtree'                "filesystem explorer
"Plugin 'Shougo/neocomplcache.vim'          "note: this plugin automatically presses esc
"Plugin 'altercation/vim-colors-solarized'  "color scheme which is not used in linux
Plugin 'brookhong/cscope.vim'               "this plugin helps find definition
"Plugin 'szw/vim-tags'                       "automatically find tags, sometimes tags file becomes too large, disable this to prevent truncating of tags file.
Plugin 'vim-scripts/drawit'                 "draw visio in vim
Plugin 'vim-scripts/taglist.vim'            "right window: code preview
Plugin 'vim-scripts/a.vim'                  "switching between .h .c
Plugin 'xolox/vim-misc'                     "pre-requisite of lua-ftplugin
Plugin 'xolox/vim-lua-ftplugin'             "the lua-ftplugin
Plugin 'vim-scripts/TagHighlight'           "The func/class name coloring for several languages
"Any github repos should be using `go get github.com/..` other than gt.
Plugin 'fatih/vim-go'                       "The go-code completer, before doing anything, install related packages via <leader>gi.
Plugin 'hari-rangarajan/CCTree'             "Call Tree View, short-cuts: <c-\-</>>,c-p,<c-\--/=>, before using it, :CCTreeLoadDB<CR>, or <leader>C
Plugin 'godlygeek/tabular'                  "prerequisite for vim-markdown, align with :Tabularize /\t<CR>
"Plugin 'plasticboy/vim-markdown'           "markdown plugin.. little use
Plugin 'vim-scripts/boolpat.vim'            "plugin to search several words using &|!, if contain ', using ''
Plugin 'junegunn/vim-easy-align'            "Plugin to align easily using gaip
Plugin 'mattn/emmet-vim'                    "Plugin to write html/css easily, see Tutorial. notes: select lines, <C-M>, and type: div#div>p#p$* #=id, $=idx, * means branching
Plugin 'pangloss/vim-javascript'            "js indentation

noremap <c-k> <c-w>k                "split windows inter-switch
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

syntax on                                   "let vim color the code
filetype on                                 "let vim check file type by ext.
filetype plugin on                          "automatically detects file type using filetype plugin, and use plugin supported for this file type
filetype plugin indent on                   "turns on filetype detection, and sets different tab settings after detection done
let g:ycm_auto_trigger = 1                  "let ycm trigger automatically
let g:ycm_min_num_of_chars_for_completion = 2       "set ycm to start completion with at least 2 letters
let g:ycm_global_ycm_extra_conf = '$VIM/vimfiles/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'  "this should be specified after succesfully compiled ycm
let g:ycm_add_preview_to_completeopt=1      "display the scratch window
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_server_python_interpreter='/usr/bin/python2'              "in archlinux, where python= python3, ycm may be built in python2, but loading python as python3.. so this should be pointed out.
let g:lua_complete_omni = 1                                         "opens autocomplete for lua, pattern given at ycm's conf
"let g:lua_check_syntax = 0                                          "default 1, if not need to check syntax everytime save file, set0
"let g:lua_check_globals = 0                                         "default 1, if not check undefined globals, set 0
"let g:lua_interpreter_path='/path/to/lua'                           "if installed lua somewhere else and not connected to vim, specify it.
"let g:lua_internal = 0                                              "if not wish to use the interface connected to vim, set this to 0, and set the above line correctly
"let g:lua_omni_blacklist=['somefolder\somemodule','another']        "this can block some modules at omni complete time
set t_ti= t_te=                                                     "this preserves vim contents after exit.
set t_Co=256                        "sets terminal color
set backspace=2                 "enable backspace
set cindent
set cinoptions=(0,u0,U0             "the previous 2 lines makes expressions span multi lines to align begining of lines to align with the beginning of the expression, note this should be used while :set noexpandtab
"set smartindent                    "indentation, automatically add more indent to the next block of file, not be set with cindent generally.
"set expandtab                      "tab replaced by spaces, if need to change all the previously entered tabs to spaces, :retab might help, if want indentation with tabs other than spaces, use :set noet, or simply delete this line
set tabstop=4                       "defines how many spaces are inserted if press one tab
set shiftwidth=4                    "number of spaces used when indentation occurs
set showtabline=0                   "This turns off the tab line even when there are plural tabs in a single window.
"set smarttab                       "if at the line start, tab is interpreted as shiftwidth, otherwise tabstop
set foldenable                      "open file with its content folded
set foldmethod=indent                   "set the way file is folded
set autoread                        "file changed if run, it will be reloaded in vim
set ignorecase                      "ignore cases when using / to find strings
set smartcase                       "ignore cases when no upper case
autocmd InsertLeave * :pclose               "leaving insert mode will trigger a :pclose which closes scratch window
autocmd InsertLeave * :let __line=line('.')
autocmd InsertLeave * :let __col=col('.')
autocmd InsertLeave * :Limelight!
autocmd InsertLeave * :cal cursor(__line,__col)
autocmd InsertLeave * :unlet __col
autocmd InsertLeave * :unlet __line
"limelight relight
"leaving insert mode will trigger
autocmd InsertEnter * :Limelight                "entering insert mode will trigger
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 79 . 'v.\+', -1)
autocmd VimEnter * call Read_CTreeXRefDB()
function Read_CTreeXRefDB()
    if filereadable('cctree.out') 
        :CCTreeLoadXRefDB ./cctree.out
    endif
endfunction 

imap <c-k> <Up>                 "insert mode ctrl+k means moving cursor up
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>

set hlsearch
set nu                          "show line number
set relativenumber              "show relative number instead
set laststatus=2                        "last status height set to 2
set cmdheight=2                 "if cmdheight is gt 2, messages will be displayed on last line
set cursorline                      "highlight the whole line where cursor is
set nowrap                      "show long line in one line, if want to show in multiple lines, set wrap
set background=dark

"Needed for base16-color-scheme in linux
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
"colorscheme base16-twilight         "specify color scheme, not needed any more if using base16-shell
set shortmess=atI                   "disable welcome screen
set guioptions-=m                   "disable menu
set guioptions-=T                   "disable tools
set guioptions-=r                   "disable scroll bar
set guioptions-=L                   "disable .. not sure
set encoding=utf-8                  "set vim encoding in utf-8
set fenc=utf-8                      "set file encoding in utf-8
set fileencodings=utf-8,latin-1,ascii,gbk,usc-bom,cp936,Shift-JIS   "set several file encodings to be supported
set ff=unix                     "set file format, it affects \n
set fileformats=unix,dos,mac                "set file format it supports
source $VIMRUNTIME/delmenu.vim          "things needed to clear welcome screen
source $VIMRUNTIME/menu.vim         "things needed to clear welcome screen
"language messages zh_CN.utf-8              "status bar and more, infos are able to be displayed in zh_CN
highlight! link DiffText MatchParen

nnoremap <c-s> :w<CR>
"for more info about certain shortcut, use :verbose map <c-s>
inoremap <c-c> <ESC>
"shortcut for esc
inoremap jk <ESC>
"according to ycm's readme, using c-c is harmful to exit insert mode.
vnoremap // y/<C-r>"<CR>N
"under visual selection search
nnoremap <c-c> :nohl<CR>:pclose<CR>
"shortcut for no-high-light & close scratch [ Plugin.YCM ]
nnoremap <c-Q> :q!<CR>

nnoremap <c-F9> :SCCompile<CR>
"shortcut for compilation
nnoremap <c-F10> :SCCompileRun<CR>
"shortcut for running
nnoremap <c-F11> :SCChooseCompiler<CR>
"shortcut for changing compiler
nnoremap <c-x> :CCTreeSaveXRefDB cctree.out<CR>
let g:ycm_min_num_identifier_candidate_chars = 2    "ycm identifier at least requires 2 letters
let g:neocomplcache_enable_at_startup=1
let g:cscope_silent = 1
let g:NERDTreeIgnore=['\.o$','\.lo$']
let g:ycm_semantic_triggers =  {
  \ 'python' : ['re!\w+'],
  \   'c' : ['->', '.','re!\w+'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re!\w+'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,perl6,scala,vb,elixir,go' : ['.', 're!\w+'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':','re!\w+'],
  \   'erlang' : [':'],
  \ }                           "ycm conditions for completion according to different languages
let mapleader=","                   "define <leader> as ','
"nnoremap <leader>cl :let __line=<C-r>=line('.')<CR><CR>:let __col=<C-r>=col('.')<CR><CR>:Limelight!<CR>:cal cursor(__line,__col)<CR>:unlet __col<CR>:unlet __line<CR>
"turn limelight off
nnoremap <leader>g gg=G
nnoremap <leader>l /<CR>jzt:nohl<CR>
nnoremap <leader>L ?<CR>njzt:nohl<CR>
nnoremap <leader>v :68vs<CR>
nnoremap <leader>s :15sp<CR>
nnoremap <leader>S :let __line=line('.')<CR>:let __col=col('.')<CR>:w !sudo tee % 2>&1 1>/dev/null<CR>:edit!<CR><CR>:cal cursor(__line, __col)<CR>:unlet __line<CR>:unlet __col<CR>
nnoremap <leader>n :NERDTree<CR>
"open nerdtree explorer
nnoremap <leader>r :vertical resize 68<CR>
"resizes split window
nnoremap <leader>t :TlistOpen<CR>
nnoremap <leader>fa :call CscopeUpdateDB()<CR> :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>fs :call CscopeFind('s',expand('<cword>'))<CR>
nnoremap <leader>fd :call CscopeFind('g',expand('<cword>'))<CR>
nnoremap <leader>w :set wrap!<CR>
"to wrap as file format, first set textwidth=num, then type gp<position>, or
"type *gp* under vision select mode
nnoremap <leader>f :UpdateTypesFileOnly<CR>
" Starting the function/class name coloring. Need universal-ctags to gen tags
"+ file before.
nnoremap <leader>i :set nu!<CR>
nnoremap <leader>o :set foldenable!<CR>
nnoremap <leader>p :set relativenumber!<CR>
nnoremap <leader>e :set et<CR>:retab<CR>
nnoremap <leader>E :set noet<CR>:retab!<CR>
nnoremap <leader>a :A<CR>
nnoremap <leader>j ::<C-r>=line('.')<CR>!python -m json.tool<CR>
"json expansion for current line. using u to go back
nnoremap <leader>u :call clearmatches()<CR>
"see vim.wikia.com/wiki/Highlight_long_lines
nnoremap <leader>C :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR> :!cscope -b -i cscope.files -f cscope.out<CR> :cs kill -1<CR>:cs add cscope.out<CR> :call CscopeUpdateDB()<CR> :CCTreeLoadDB<CR><CR>
nnoremap <leader>m :!man <C-R><C-W><CR><CR>
"current word
nnoremap <leader>bp :BoolPat 
nnoremap <leader>ni :setl noai nocin nosi inde=<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:Tlist_Auto_Highlight_Tag = 1              "taglist configuration
let g:Tlist_Tlist_Close_On_Select = 1
let g:Tlist_Compact_Format = 1
let g:Tlist_Display_Prototype = 0
let g:Tlist_Display_Tag_Scope = 1
let g:Tlist_Enable_Fold_Column = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_File_Fold_Auto_Close = 1
let g:Tlist_GainFocus_On_ToggleOpen = 0
let g:Tlist_Highlight_Tag_On_BufEnter = 1
let g:Tlist_Inc_Winwidth = 1
let g:Tlist_Process_File_Always = 0
let g:Tlist_Show_Menu = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_Sort_Type = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Use_SingleClick = 1
let g:Tlist_WinWidth = 32
let g:Tlist_WinHeight = 12

"Golang Short-cuts
au FileType go call SetGOOptions()
function SetGOOptions()
    nmap <leader>gi :GoInstallBinaries
    nmap <leader>r <Plug>(go-run)
    nmap <leader>b <Plug>(go-build)
    "nmap <leader>t <Plug>(go-test)
    nmap <leader>c <Plug>(go-coverage)
    nmap <Leader>ds <Plug>(go-def-split)
    nmap <Leader>dv <Plug>(go-def-vertical)
    nmap <Leader>dt <Plug>(go-def-tab)
    nmap <Leader>gc <Plug>(go-doc)
    nmap <Leader>gv <Plug>(go-doc-vertical)
    nmap <Leader>gb <Plug>(go-doc-browser)
    nmap <Leader>s <Plug>(go-implements)
    nmap <Leader>i <Plug>(go-info)
    nmap <Leader>e <Plug>(go-rename)
    "tagbar setting
    nnoremap <leader>t :TagbarToggle<CR>
    nnoremap <leader>S :GoFmt<CR>:let __line=line('.')<CR>:let __col=col('.')<CR>:w !sudo tee % 2>&1 1>/dev/null<CR>:edit!<CR><CR>:cal cursor(__line, __col)<CR>:unlet __line<CR>:unlet __col<CR>
endfunction

"emmet-vim conf
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-M>'

"vim-js conf
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1

"CCTree Cfg
let CCTreeDbFileMaxSize=1000000000

function SetET()
    set et
    retab
endfunction
function SetNoET()
    set noet
    retab
endfunction
function SetCCPPOptions()
    set nofoldenable
    call SetNoET()
endfunction
function SetMDOptions()
    set conceallevel=2
    set nofoldenable
    set wrap
    "disables autoindent for current content.
    setl noai nocin nosi inde=
    nnoremap <c-g> :%!/usr/local/bin/mdlinks<CR>
    call SetET()
endfunction
function SetSTPOptions()
    set sw=2 ts=8 cino=>4,n-2,{2,^-2,t0,(0,u0,w1,M1
endfunction

"markdown scripts
au FileType md call SetMDOptions()
au FileType markdown call SetMDOptions()
au FileType sh,vim call SetET()
"c/cpp scripts
au FileType c,cpp,h,hpp,cxx call SetCCPPOptions()
"haskell scripts
au FileType haskell call SetET()
au FileType text setl noai nocin nosi inde=
"stap scripts
au FileType stp call SetSTPOptions()
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
