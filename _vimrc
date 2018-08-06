set nocompatible

set runtimepath+=D:/Tools/Vim/vimfiles/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('D:/Tools/Vim/vimfiles/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
	\ 'build': {
	\     'windows': 'tools\\update-dll-mingw',
	\     'cygwin': 'make -f make_cygwin.mak',
	\     'mac': 'make -f make_mac.mak',
	\     'linux': 'make',
	\     'unix': 'gmake',
	\    }
	\ })
call dein#add('Shougo/unite.vim')

call dein#add('jiangmiao/auto-pairs')
call dein#add('tpope/vim-repeat', {'on_map' : '.'})
call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
call dein#add('tpope/vim-ragtag')
call dein#add('ctrlpvim/ctrlp.vim', { 'on_map': '<C-p>', 'on_cmd' : 'CtrlPMRUFiles' })
call dein#add('othree/html5.vim', { 'on_ft': 'html' })
" call dein#add('vim-scripts/mayansmoke', { 'script_type': 'colors/mayansmoke.vim' })
call dein#add('ervandew/supertab')
call dein#add('scrooloose/syntastic')
call dein#add('tomtom/tcomment_vim', { 'on_map': 'gc', 'on_cmd' : 'TComment'})
call dein#add('ap/vim-buftabline')
call dein#add('easymotion/vim-easymotion')
call dein#add('blertzupfgut/mayansmoke', { 'script_type': 'colors/mayansmoke.vim' })

call dein#end()

set noswapfile
set nobackup

source $VIMRUNTIME/mswin.vim
behave mswin
set selectmode=

autocmd! bufwritepost _vimrc source %
autocmd bufwritepre <buffer> :%s/\s\+$//e
" GEHT NICHT: autocmd bufreadpost * tab ball

" execute pathogen#infect()

filetype plugin indent on
syntax enable

if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
  \ if &omnifunc == "" |
  \ setlocal omnifunc=syntaxcomplete#Complete |
  \ endif
endif

" GUI

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\10
  elseif has("gui_win32")
    set guifont=Consolas:h9:cANSI
  endif
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=55 columns=180
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

colorscheme mayansmoke

set showtabline=2
set guitablabel=\[%N\]\ %t\ %M

" No menu, toolbar and scrollbar, and tabline
" set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e

set guicursor=a:blinkon500-blinkoff500  " Slow down cursor blinking speed
set guicursor+=n:blinkon0

if has('mouse')
  set mouse=a
endif

set cursorline
set hidden        " hide buffers, don't close them
set nowrap        " don't wrap lines
set tabstop=2     " a tab is 2 spaces
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
" set nuw=6         " line numer width
set wmh=0         " window min height
set wmw=0         " window min width
set linespace=0

set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete com
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set encoding=utf-8
set fileencoding=utf-8
set autoread

set splitright
set splitbelow

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Key mappings

let mapleader=" "
let g:mapleader = " "

" Make German keyboard working
map ä }
map Ä {
map ü ]
map Ü [
map ß /
" map ö [
" map Ö {

" Better movements
noremap l h
noremap ö l
noremap h <nop>
noremap L H
noremap Ö L
noremap H <nop>

" Normal Mode

" Buffers
nnoremap <C-J> :bprev<CR>
nnoremap <C-K> :bnext<CR>
nnoremap <leader>j :bprev<CR>
nnoremap <leader>k :bnext<CR>

nnoremap <leader>b :ls<CR>:b<Space>

" Splits
"nnoremap <leader>s :sp<CR>
"nnoremap <leader>v :vsp<CR>

" Switch splits with maximize
" nnoremap <C-Down> <C-W>j<C-W>_
" nnoremap <C-Up> <C-W>k<C-W>_
" nnoremap <C-Left> <C-W>h<C-W>_
" nnoremap <C-Right> <C-W>l<C-W>_

" Switch splits
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

" Toggle search highlights
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Easymotion

" Move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" nmap s <Plug>(easymotion-overwin-f)

" Move to {char}
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

" Move to word
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

" Move to line
map  <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" tComment
vmap gcc gc

" Yank line before toggle comment
nmap gy yygcc
vmap gy ygvgc

" Yank and paste line before toggle comment and remember position
" Works both in normal and insert mode
" Use :t-1 instead of yyP to preserve registers
" GEHEN NICHT:
" nmap gyy mz:t-1<cr>gCc`zmz
" imap gyy <esc>:t-1<cr>gCcgi
" vmap gyy ygvgc'>gp'.

" Insert Mode

" Exit
imap jj <Esc>

" Misc. Modes

" Fast saving
nnoremap <leader>w :w<CR>
" inoremap <leader>w <C-c>:w<CR>i

" Fast closing
nnoremap <leader>d :bd<CR>
" inoremap <leader>d <C-c>:bd<CR>

" Auto-align paragraph
nnoremap <leader>a =ip
" inoremap <leader>a <C-c>=ipi

" Plugins

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'a'

let g:EasyMotion_smartcase = 1

let g:javascript_enable_domhtmlcss=1
let g:used_javascript_libs='jquery,underscore,angularjs,angularui,requirejs,jasmine,chai,handlebars'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Diff

" Convenience to diff between the current buffer and the file it was loaded from, thus the changes you made
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

set diffexpr=MyDiff()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
