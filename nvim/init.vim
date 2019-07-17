set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Initial_Setup_Instructions:----------------------------------------------{{{1
" Install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then use :PlugInstall

" Plugin_Support:
" pip3 install pynvim flake8 yapf
" powerline fonts: see note below
" universal c-tags: brew install --HEAD universal-ctags/universal-ctags/universal-ctags
" brew install ack (if not already installed)
"       or
" brew install the_silver_searcher (configure choice below)
" brew install fzf (if not already installed)

" Updating_netrw:
" check latest version with :echo g:loaded_netrwPlugin
" clean existing version:
"   ni http://www.drchip.org/astronaut/vim/vbafiles/netrwclean.vba.gz
"   :packadd vimball
"   :UseVimball ~/.dotfiles/nvim/local-plugs/netrwclean
"   :NetrwClean
" exit vim and then get and install the latest version of netrw:
"   it's not possible to open from the url as netrw is uninstalled :/
"   curl http://www.drchip.org/astronaut/vim/vbafiles/netrw.vba.gz -o ~/Downloads/netrw.vba.gz
"   ni ~/Downoads/netrw.vba.gz
"   :packadd vimball
"   :UseVimball ~/.dotfiles/nvim/local-plugs/netrw
" it should now be picked up by vim-plug by adding the following:
"   Plug '~/.dotfiles/nvim/local-plugs/netrw'
"

" Themes:
" Create a colors directory ~/.config/nvim/colors
" Curl them with -o option to write a file
" or just install with Vimplug :)

" Powerline_fonts:
" Download 'Meslo Slashed' from https://github.com/powerline/fonts
" Install locally then set iterm non-ascii font to '12pt Meslo LG S Regular for Powerline'

" Vimplug:-----------------------------------------------------------------{{{1

call plug#begin()
Plug '~/.dotfiles/nvim/local-plugs/netrw'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'alfredodeza/pytest.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
" Unused, may reinstall
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'sbdchd/vim-run'
" Plug 'Chiel92/vim-autoformat'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets' "contains the acutal snippets for use in ultisnips
" Themes
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'veloce/vim-aldmeris'
Plug 'nightsense/forgotten'
Plug 'nightsense/snow'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
" Plug 'lifepillar/vim-solarized8'
call plug#end()

" Basic settngs:-----------------------------------------------------------{{{1

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

" I know this is terrible but it is nice to scroll...
set mouse=a

" Persistent Undo
set undofile

" diff is vertical by default
" set diffopt+=vertical

" live substitute preview. change to split if changes are off screen
set inccommand=nosplit

" Line numbers:------------------------------------------------------------{{{1
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Themes:------------------------------------------------------------------{{{1
" install with plug
" or place in the colors directory ~/.config/nvim/colors using curl -o

" true color support
set termguicolors
" set background=light
set background=dark

colorscheme gruvbox

" colorscheme forgotten-dark
" let g:airline_theme='snow_dark'

" molokai specific adjustments
" highlight cursorline ctermbg=236 ctermfg=none
" highlight colorcolumn ctermbg=darkred
" highlight Visual cterm=bold ctermbg=247 ctermfg=NONE
" highlight Comment ctermfg=244
" highlight! link TermCursor Cursor
" highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15

" Finding and autocomplete:------------------------------------------------{{{1
set wildmenu
set ignorecase
set smartcase
set showmatch

" File Explorer:-----------------------------------------------------------{{{1

" open in a split with :Vex
" open in previous window with P
" resume exploring with :Rex
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" SuperTab:----------------------------------------------------------------{{{1

let g:SuperTabDefaultCompletionType = "<c-n>" "set order of options to down

" Git:---------------------------------------------------------------------{{{1
" reduce the lag between vimgutter updates
set updatetime=100
" command Gadiff Gdiff :1:% | Gvdiff<CR>

" Ack:---------------------------------------------------------------------{{{1
" set default behaviour not to open first result automatically
cnoreabbrev Ack Ack!
let g:ackprg = 'ag --nogroup --nocolor --column'

" Virtualenv:--------------------------------------------------------------{{{1
" This is still a mess and needs a proper solution to be determined

" Figure out the system Python for Neovim.
" if exists("$VIRTUAL_ENV")
"     let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
" else
"     let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
" endif
if $LOCATION == 'work'
    let g:python3_host_prog = '/Users/russellwinch/miniconda3/bin/python'
else
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

" Deoplete:----------------------------------------------------------------{{{1

let g:deoplete#enable_at_startup = 1

" Ale:---------------------------------------------------------------------{{{1

" if $LOCATION != 'work'
"     if exists("$VIRTUAL_ENV")
"         let g:ale_python_flake8_executable=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
"     else
"         let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
"     endif
"     let g:ale_python_flake8_options = '-m flake8'
" endif

" let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
" let g:ale_python_flake8_options = '-m flake8'

let g:ale_linters = {'python': ['flake8']}
if $LOCATION == 'work'
    let g:ale_python_flake8_options = '--max-line-length 88 --ignore E501,W503'
endif
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1

" Lightline:---------------------------------------------------------------{{{1

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Gutentags:---------------------------------------------------------------{{{1
let g:gutentags_cache_dir = '~/.gutentags/'
let g:gutentags_ctags_exclude = ['*.html']

" SuperTab:----------------------------------------------------------------{{{1

let g:SuperTabDefaultCompletionType = "<c-n>" "set order of options to down

" fzf:---------------------------------------------------------------------{{{1
nnoremap <C-p> :Files<Cr>
nnoremap <leader>bb :Buffers<Cr>
nnoremap <leader>w :Windows<Cr>

" Remappings:--------------------------------------------------------------{{{1
" insert blank row
nnoremap <leader>r o<ESC>
nnoremap <leader>R O<ESC>

" navigating between vim tabs and buffers
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
nnoremap <leader>tt :tabedit %<CR>
" nnoremap <leader>bn :bn<CR>
" nnoremap <leader>bp :bp<CR>

" delete buffer
nnoremap <leader>bd :bn<CR>:bd#<CR>

" use relative numbering
nnoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>
" inoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>i

" open vimrc in a tab for a quick edit
nnoremap <leader>ve :tabe $MYVIMRC<cr>
" source the vimrc file
nnoremap <leader>vs :source $MYVIMRC<cr>

" - search & highlighting
nnoremap <silent> <leader>hh :nohl<cr>

" navigate between splits
nmap <silent><Space> <C-w>w

" copy and paste
vnoremap <leader>c "*y
inoremap <leader>c "*yy
nnoremap <leader>c "*yy
inoremap <leader>v <ESC>"*pa
inoremap <leader>V <ESC>"*Pa
nnoremap <leader>v "*p
nnoremap <leader>V "*P

" snippets
inoremap <leader>td # TODO:
nnoremap <leader>td o# TODO:
nnoremap <leader>st Oimport pdb; pdb.set_trace()<ESC>
nnoremap <leader>ip Ofrom IPython import embed; embed()<ESC>
nnoremap <leader>ft :Ack! pdb<CR>

" pretty print json
nnoremap <leader>jp :%!python -m json.tool<cr>
vnoremap <leader>jp :%!python -m json.tool<cr>

" search for selected text from visual mode
vnoremap // y/<C-R>"<CR>

" navigate through errors
nnoremap <leader>e :ALENext<cr>
nnoremap <leader>E :ALEPrevious<cr>
nnoremap <silent>]e :ALENext<cr>
nnoremap <silent>[e :ALEPrevious<cr>
nnoremap <silent>[E :ALEFirst<cr>
nnoremap <silent>]E :ALELast<cr>

" update all git guttters after a commit
nnoremap <leader>gg :GitGutterAll<cr>

" open 4 way git diff
nnoremap <leader>gd :Gsplit :1:%<cr> <C-w>W  :Gvdiff!<cr>

" remove trailing white spaces from lines
nnoremap <silent><leader>tw :%s/\s\+$//e<cr>

" toggle left explorer
nnoremap <silent><leader>l :Lexplore<cr>

" Terminal:----------------------------------------------------------------{{{1
" tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
" the above intefers with fzf so use:
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au FileType fzf tunmap <buffer> <Esc>

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

" highlight Foldcolumn ctermfg=Darkgrey ctermbg=0 cterm=BOLD
" highlight Folded ctermfg=Darkgrey ctermbg=NONE cterm=none
set foldcolumn=2
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
" Deprecated:--------------------------------------------------------------{{{1
" CtrlP:-------------------------------------------------------------------{{{2
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_extensions = ['tag']
" let g:ctrlp_switch_buffer = '0'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"
" navigate between buffers
" nnoremap <leader>b :CtrlPBuffer<cr>
" nnoremap <leader>bb :CtrlPBuffer<cr>

" AIRLINE:-----------------------------------------------------------------{{{2

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" UltiSnips:---------------------------------------------------------------{{{2

" let g:UltiSnipsExpandTrigger="<C-j>"
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" end of vimrc
