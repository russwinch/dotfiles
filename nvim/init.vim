set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Initial_Setup_Instructions:----------------------------------------------{{{1
" Install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then use :PlugInstall

" Plugin_Support:
" pip3 install neovim flake8 yapf
" powerline fonts: https://github.com/powerline/fonts
" universal c-tags: brew install --HEAD universal-ctags/universal-ctags/universal-ctags
" create a folder for tags: ~/.gutentags/

" Themes:
" Create a colors directory ~/.config/nvim/colors
" Create a colors directory and then curl them with -o option to write a file

" Powerline_fonts:
" Download 'Meslo Slashed' from https://github.com/powerline/fonts
" Install locally then set iterm non-ascii font to '12pt Meslo LG S Regular for Powerline'

" Vimplug:-----------------------------------------------------------------{{{1

call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' "contains the acutal snippets for use in ultisnips
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sbdchd/vim-run'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-sort-motion'
" Plug 'Chiel92/vim-autoformat'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-line'
" Plug 'ambv/black'
" Plug 'zchee/deoplete-jedi'
call plug#end()

" BASIC SETTNGS:-----------------------------------------------------------{{{1

syntax enable
set shortmess+=Iw
set list
set showbreak=↳\ 
set visualbell
set cursorline
set title

" Tabs, spaces and wrapping
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" environmental variable set in .bashrc
if $LOCATION == 'work'
    set textwidth=88
else
    set textwidth=79
endif
set colorcolumn=+1

" Splits and buffers - feels more natural
set splitbelow
set splitright
" set hidden

" i know this is terrible but it is nice to scroll...
set mouse=a

" Persistent Undo
set undofile

" LINE NUMERING:-----------------------------------------------------------{{{1

" set number
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Themes:------------------------------------------------------------------{{{1
" place in the colors directory ~/.config/nvim/colors using curl -o
" colorscheme badwolf "https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

set termguicolors
" set background=light
" colorscheme fruidle
set background=dark
colorscheme molokai "https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
highlight cursorline ctermbg=236 ctermfg=none
highlight colorcolumn ctermbg=darkred
highlight Visual cterm=bold ctermbg=247 ctermfg=NONE
highlight Comment ctermfg=244
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15

" FINDING AND AUTOCOMPLETE:------------------------------------------------{{{1

set wildmenu
set ignorecase
set smartcase
set showmatch

" SuperTab:----------------------------------------------------------------{{{1

let g:SuperTabDefaultCompletionType = "<c-n>" "set order of options to down

" Virtualenv:--------------------------------------------------------------{{{1

" Figure out the system Python for Neovim.
" if exists("$VIRTUAL_ENV")
"     let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
" else
"     let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
" endif
let g:python3_host_prog = '/usr/local/bin/python3'

" Deoplete:----------------------------------------------------------------{{{1

let g:deoplete#enable_at_startup = 1

" UltiSnips:---------------------------------------------------------------{{{1

let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Ale:---------------------------------------------------------------------{{{1

if $LOCATION != 'work'
    if exists("$VIRTUAL_ENV")
        let g:ale_python_flake8_executable=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
    else
        let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
    endif
    let g:ale_python_flake8_options = '-m flake8'
endif

let g:ale_linters = {'python': ['flake8']}
if $LOCATION == 'work'
    let g:ale_python_flake8_options = '--max-line-length 88'
endif
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1

" AIRLINE:-----------------------------------------------------------------{{{1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" set statusline+=%{gutentags#statusline()}

" Gutentags:---------------------------------------------------------------{{{1
let g:gutentags_cache_dir = '~/.gutentags/'


" CtrlP:-------------------------------------------------------------------{{{1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_extensions = ['tag']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Remappings:--------------------------------------------------------------{{{1

" remap the Leader key:
" let mapleader = ","
" let maplocalleader = "\\"

" disable the arrow keys:
" : in NORMAL mode
" noremap <up> <Nop>
" noremap <left> <Nop>
" noremap <right> <Nop>
" noremap <down> <Nop>

" : in INSERT mode
" inoremap <up> <Nop>
" inoremap <left> <Nop>
" inoremap <right> <Nop>
" inoremap <down> <Nop>

" : in VISUAL mode
" vnoremap <up> <Nop>
" vnoremap <left> <Nop>
" vnoremap <right> <Nop>
" vnoremap <down> <Nop>

" quick pairs in INSERT mode
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>* **<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>t[ [  ]<ESC>hi
inoremap <leader>{ {}<ESC>i
inoremap <leader>< <><ESC>i
" surround a word with ... pairs
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>__ viw<esc>a__<esc>hbi__<esc>lel
" exit pair(s) to end of line:
inoremap <c-l> <ESC>A
" exit nested pair to within parent pair:
inoremap <c-k> <ESC>la

"smash escape
" inoremap jk <ESC>

" insert blank row
nnoremap <leader>r o<ESC>
nnoremap <leader>R O<ESC>

" navigating between vim tabs and buffers
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" delete buffer
nnoremap <leader>bd :bn<CR>:bd#<CR>

" navigate between buffers
nnoremap <leader>b :CtrlPBuffer<cr>

" use relative numbering
nnoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>
inoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>i

" open vimrc in a split for a quick edit
nnoremap <leader>ev :tabe $MYVIMRC<cr>
" source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
"
" -all-caps & continue in INSERT mode
" inoremap <c-u> <esc>viwUea
" -all-caps & continue in NORMAL mode
" nnoremap <c-u> viwUea<ESC>
"
" - search & highlighting
nnoremap <silent> <leader>hh :nohl<cr>

" navigate between splits
nmap <Space> <C-w>w
" - option + h, j, k, l come out as symbols on mac
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

tnoremap ˙ <C-\><C-n><C-w>h
tnoremap ∆ <C-\><C-n><C-w>j
tnoremap ˚ <C-\><C-n><C-w>k
tnoremap ¬ <C-\><C-n><C-w>l

" vim-autoformat
" nnoremap <F3> :Autoformat<CR>

" vim-run
nnoremap <F5> :Run<CR>

" copy and paste
vnoremap <leader>c "*y
inoremap <leader>c "*yy
inoremap <leader>v <ESC>"*pa
inoremap <leader>V <ESC>"*Pa
nnoremap <leader>c "*yy
nnoremap <leader>v "*p
nnoremap <leader>V "*P

" snippets
inoremap <leader>td # TODO:
nnoremap <leader>td o# TODO:
nnoremap <leader>st Oimport pdb; pdb.set_trace()<ESC>
nnoremap <leader>ft :Ack pdb<CR>

" pretty print json
nnoremap <leader>jp :%!python -m json.tool<cr>
vnoremap <leader>jp :%!python -m json.tool<cr>

" Terminal:-----------------------------------------------------------------{{{1
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

function! OpenVertTerm()
    88vs | te
    set nonumber
    startinsert
endfunction

nnoremap <leader>tev :call OpenVertTerm()<cr>

function! OpenHorzTerm()
    sp | te
    set nonumber
    startinsert
endfunction

nnoremap <leader>teh :call OpenHorzTerm()<cr>

" Folding:-----------------------------------------------------------------{{{1

highlight Foldcolumn ctermfg=Darkgrey ctermbg=0 cterm=BOLD
highlight Folded ctermfg=Darkgrey ctermbg=NONE cterm=none
set foldcolumn=4
set foldmethod=marker
set foldlevelstart=0

function! MyFoldText()  "  {{{2
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  let onetab = strpart('           ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction  "  2}}}

set foldtext=MyFoldText()

" end of vimrc
