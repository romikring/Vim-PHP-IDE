call pathogen#infect()      "Executes the pathogen plugin, which loads other plugins
let mapleader=","           "Changes Leader key into a comma instead of a backslash
set nocompatible            "Prefents VIM from being nerfed into acting like VI
set viminfo='1000,f1,:1000,/1000
set history=500

au FileType php set omnifunc=phpcomplete#CompletePHP
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.inc     set filetype=php
    autocmd BufRead,BufNewFile *.include set filetype=php
    autocmd BufRead,BufNewFile *.sass    set filetype=sass
  augroup END
endif

"------  Visual Options  ------
set guioptions=egmt         "remove toolbar, scrollbars
syntax on                   "Enables syntax highlighting
set nu                      "Enable Line Numbers
set nowrap                  "Disable word wrap
set vb                      "Visual bell instead of beeps
set ruler                   "Displays cursor position on bottom right of screen
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

"------  Behavior  ------
set tabstop=4               "tab = 4 spaces
set shiftwidth=4            "Indent to four spaces
set hidden                  "Switch between unsaved buffers w/o needing to save, preserves history
filetype indent on          "Syntax Highlight
filetype plugin on          "Needed for snipMate
set autoindent              "Autoindent
set expandtab               "Use spaces instead of tabs
"Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*

"------  Special Coffee Behavior ------
" au BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
" autocmd BufNewFile,BufRead *.coffee set filetype=coffee
" au BufWritePost *.coffee silent make!
" autocmd QuickFixCmdPost * nested cwindow | redraw!

"------  Searching  ------
set incsearch               "Search while typing
set ignorecase              "Case Insensitive Searching
set smartcase               "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch                "Highlight all search results
"Following line clears the search highlights when pressing Lb
nnoremap <leader>b :nohlsearch<CR>
"" http://www.vim.org/scripts/script.php?script_id=2572
"noremap <leader>a :Ack 
"noremap <leader>A <C-w>j<C-w>c<C-w>l
"let g:ackprg="ack -H --nocolor --nogroup --column --type-add php=.tpl"
"
"------  Encoding  ------
set termencoding=utf8
set fileencodings=utf8,cp1251
set encoding=utf8

"------  Replacing ------
"type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>

"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" These prevent accidentally loading files while in the NERDTree panel
autocmd FileType nerdtree noremap <buffer> <A-left> <nop>
autocmd FileType nerdtree noremap <buffer> <A-right> <nop>
autocmd FileType nerdtree noremap <buffer> <A-up> <nop>
autocmd FileType nerdtree noremap <buffer> <A-down> <nop>

"------  Tagbar Options  ------
" http://adamyoung.net/Exuberant-Ctags-OS-X
" http://www.vim.org/scripts/script.php?script_id=273
let g:tagbar_width=26
noremap <silent> <Leader>y :TagbarToggle<CR>

"------  Buffers  ------
" Ctrl Left & Right move between buffers
noremap <silent> <A-left> :bprev<CR>
noremap <silent> <A-right> :bnext<CR>

nmap <A-UP> <ESC>:BufExplorer<CR>
vmap <A-UP> <ESC>:BufExplorer<CR>
imap <A-UP> <ESC>:BufExplorer<CR>
nmap <A-DOWN> <ESC>:BufExplorer<CR>
vmap <A-DOWN> <ESC>:BufExplorer<CR>
imap <A-DOWN> <ESC>:BufExplorer<CR>

" Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! %!sudo tee > /dev/null %

" Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

"------  Fugitive  ------ 
"https://github.com/tpope/vim-fugitive
"nnoremap <Leader>gs :Gstatus<CR>
"nnoremap <Leader>gr :Gremove<CR>
"nnoremap <Leader>gl :Glog<CR>
"nnoremap <Leader>gb :Gblame<CR>
"nnoremap <Leader>gm :Gmove 
"nnoremap <Leader>gp :Ggrep 
"nnoremap <Leader>gR :Gread<CR>
"nnoremap <Leader>gg :Git 
"nnoremap <Leader>gd :Gdiff<CR>

"------  Moving Between Windows  ------
"nnoremap <Leader>h <C-w>h
"nnoremap <Leader>l <C-w>l
"nnoremap <Leader>j <C-w>j
"nnoremap <Leader>k <C-w>k
"nnoremap <Leader>wo <C-w>o
"nnoremap <Leader>wv <C-w>v<C-w>l
"nnoremap <Leader>ws <C-w>s
"nnoremap <Leader>ww <C-w><C-w>

" Opens an edit command with the path of the currently edited file filled in Normal mode: <Leader>ee
map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" When pressing <leader>cd switch to the directory of the open buffer
"map <Leader>cd :cd %:p:h<CR>
" ,ct = Builds ctags
map <Leader>ct :! /usr/local/bin/ctags -R *<CR>

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>
" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>
" ,U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>
" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>
" ,p = Runs PHP lint checker on current file
map <Leader>p :! php -l %<CR>
" ,P = Runs PHP and executes the current file
map <Leader>P :! php -q %<CR>
" ,L = Toggle line numbers
map <Leader>L :set invnumber<CR>
" ,v = Paste
map <Leader>v "+gP
" ,c = Copy
map <Leader>c "+y

" Deletes trailing space in file upon write
" autocmd BufWritePre * :%s/\s\+$//e

map <Leader>? :Helptags<CR>

if has("gui_running")
    set cursorline                  "Highlight background of current line
    autocmd VimEnter * NERDTree     "run nerdtree
    "autocmd VimEnter * TagbarOpen
	colorscheme solarized
	set background=dark

    " Show tabs and newline characters with ,s
    nmap <Leader>s :set list!<CR>
	set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×,eol:¬
    "Invisible character colors
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59

	" Ctrl + Shift + C and Ctrl + Shift + V for copying and pasting OS Buffer
	" Vim can't do Ctrl + Shift :'(
	" which means C-V overwrites visual select (C-v)
	"map <C-C> "+y
	"map <C-V> "+gp
else
    set t_Co=256
    colorscheme Mustang             "This theme actually works in 256, ir_black doesn't
	set mouse=a						"This allows mouse scrolling in terminal, and selection of text

    nmap <Leader>s :set list!<CR>
	set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×,eol:¬
endif

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif

inoremap <C-L> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-L> :call PhpDocSingle()<CR> 
vnoremap <C-L> :call PhpDocRange()<CR>

" Do not need stick to top or bottom
set scrolljump=7
set scrolloff=7

" Load php-doc plugin
so ~/.vim/plugin/php-doc.vim 
map <C-R> :exe PhpDoc()<CR> 
map <C-F> :exe PhpDocVarBlock()<CR>

