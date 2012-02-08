
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect() 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题

set t_Co=65536
colorscheme lucius

" Enable filetype plugin
syntax on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set nu
set autoread
set history=200

"set scrolloff=5                 " keep at least 5 lines above/below cursor
"set sidescrolloff=5             " keep at least 5 columns left/right of cursor

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1      " http://andrew.sayya.org/blog/?p=454 

fun! ViewUTF8()
set encoding=utf-8
set termencoding=big5
endfun

fun! UTF8()
set encoding=utf-8
set termencoding=big5
set fileencoding=utf-8
set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
set encoding=big5
set fileencoding=big5
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

" allow editing multiple unsaved buffers 允許不保存buffer而切換buffer, buffer 就是只一次開啟多個檔案編輯時的其他檔案
set hidden "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them. Cursor shows matching ) and }
set showmode
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
set undolevels=200 				" number of forgivable mistakes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set linebreak               "set lbr
set tw=500                  "set textwidth

"set autoindent smartindent      " turn on auto/smart indenting 在複製貼上時如果貼上的文字有tab會整個亂掉可以 :set noai 再貼上
set ai "Auto indent
set si "Smart indet
"set nowrap 							"不自动换行
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

""""""""""""""""""""""""""""""
"MRU plugin
""""""""""""""""""""""""""""""
let MRU_File = $HOME.'/.vim/.vim_mru_files'
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix 
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
"fold 
"http://www.linux.com/archive/articles/114138
""""""""""""""""""""""""""""""
"set foldmarker={{{,}}}
"set foldmethod=marker
set foldmethod=syntax
set foldlevel=0 " 預設全部關閉
set foldnestmax=3
"Zf#j  creates a fold from the cursor down  #  lines.
"Zf/string creates a fold from the cursor to string .
"Zj moves the cursor to the next fold.
"Zk moves the cursor to the previous fold.
"Zo opens a fold at the cursor.
"ZO opens all folds at the cursor.
"Zm increases the foldlevel by one.
"ZM closes all open folds.
"Zr decreases the foldlevel by one.
"ZR decreases the foldlevel to zero -- all folds will be open.
"Zd deletes the fold at the cursor.
"ZE deletes all folds.
"[z move to start of open fold.
"]z move to end of open fold.


