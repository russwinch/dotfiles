set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Initial_Setup_Instructions:----------------------------------------------{{{1
" Install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then use :PlugInstall

" Plugin_Support:
" create virtualenv nvim in home/venvs and pip install pynvim, flake8
" python2 -m pip install ropevim pynvim
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
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'ludovicchabant/vim-gutentags'
Plug 'christoomey/vim-sort-motion'
Plug 'alfredodeza/pytest.vim', {'for': 'python'}
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'ervandew/supertab'
" Unused, may reinstall
" Plug 'python-rope/ropevim'
" Plug 'mileszs/ack.vim'
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

" spell checking for git commits
autocmd FileType gitcommit setlocal spell

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
set hidden

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

" dont show the annoying completion window
" set completeopt=menu,longest

" add spelling completion when spellcheck is activated
set complete=.,w,b,u,t,i,kspell

" SuperTab:----------------------------------------------------------------{{{1

let g:SuperTabDefaultCompletionType = "<c-n>" "set order of options to down
" let g:SuperTabClosePreviewOnPopupClose = 1

" File Explorer:-----------------------------------------------------------{{{1

" open in a split with :Vex
" open in previous window with P
" resume exploring with :Rex
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" Git:---------------------------------------------------------------------{{{1
" reduce the lag between vimgutter updates
set updatetime=100
" command! Gadiff Ghdiff :1:% | Gvdiff!<CR>

" Virtualenv:--------------------------------------------------------------{{{1

" install pynvim, flake8, pytest into this venv
let g:python3_host_prog = $HOME.'/venvs/nvim/bin/python3'

let g:pytest_executable = substitute(system("which -a pytest | head -n2 | tail -n1"), "\n", '', 'g')

" Deoplete:----------------------------------------------------------------{{{1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0
" let g:deoplete#sources#jedi#show_docstring = 1

" <TAB> completion
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" let g:deoplete#disable_auto_complete = 1
" complete on press of tab only, used when auto complete is off

" inoremap <silent><expr> <TAB>
" \ pumvisible() ? "\<C-n>" :
" \ <SID>check_back_space() ? "\<TAB>" :
" \ deoplete#manual_complete()
" function! s:check_back_space() abort "{{{
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
" function! s:check_back_space() abort "{{{
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}

" Ale:---------------------------------------------------------------------{{{1

let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_executable = $HOME.'/venvs/nvim/bin/flake8'
let g:ale_python_flake8_options = '--max-line-length 88 --ignore E501,W503'
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
nnoremap <leader>tu :GutentagsUpdate<CR>

" fzf:---------------------------------------------------------------------{{{1
nnoremap <C-p> :Files<Cr>
nnoremap <leader>bb :Buffers<Cr>
nnoremap <leader>w :Windows<Cr>
"
" Jedi:--------------------------------------------------------------------{{{1
let g:jedi#goto_command = "<leader>gd"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>gu"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>gr"

let g:jedi#show_call_signatures = "2"
let g:jedi#completions_enabled = 0

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

" reload all buffers with syntax highlighting
nnoremap <leader>br :execute 'bufdo :e' <bar> source $VIMRUNTIME/syntax/syntax.vim<cr>

" use relative numbering
nnoremap <leader>u <ESC>:set relativenumber!<CR><ESC>
" inoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>i

" open vimrc in a tab for a quick edit
nnoremap <leader>ve :tabe $MYVIMRC<cr>
" source the vimrc file
nnoremap <leader>vs :source $MYVIMRC<cr>

" cancel highlight
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
nnoremap <leader>st Obreakpoint()<ESC>
nnoremap <leader>ip Ofrom IPython import embed; embed()<ESC>
nnoremap <leader>ft :Ag breakpoint<CR>

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
nnoremap <leader>gd :Gsplit :1:%<cr> <C-w>W :Gvdiff!<cr>

" remove trailing white spaces from lines
nnoremap <leader>tw :%s/\s\+$//e<cr>

" toggle left explorer
nnoremap <silent><leader>l :Lexplore<cr>

" pytest
nnoremap <leader>ta :Pytest file<cr>
nnoremap <leader>tc :Pytest class<cr>
nnoremap <leader>tm :Pytest method<cr>
nnoremap <leader>tf :Pytest function<cr>
nnoremap <leader>tva :Pytest file verbose<cr>
nnoremap <leader>tvc :Pytest class verbose<cr>
nnoremap <leader>tvm :Pytest method verbose<cr>
nnoremap <leader>tvf :Pytest function verbose<cr>
nnoremap <leader>te :Pytest next<cr>
nnoremap <leader>tE :Pytest previous<cr>
nnoremap <leader>tve :Pytest error<cr>

" execute in python
nnoremap <silent><leader>rp :w ! python<cr>
vnoremap <silent><leader>rp :w ! python<cr>

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

set foldcolumn=2
set foldmethod=marker
set foldlevelstart=0

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
" Ack:---------------------------------------------------------------------{{{2
" set default behaviour not to open first result automatically
cnoreabbrev Ack Ack!
let g:ackprg = 'ag --nogroup --nocolor --column'


" ----------------------------- end of vimrc ----------------------------------
