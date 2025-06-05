set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Initial_Setup_Instructions:----------------------------------------------{{{1
" Install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then use :PlugInstall

" Plugin_Support:
" create virtualenv nvim in home/venvs and pip install pynvim, flake8, jedi, black
" brew install the_silver_searcher

" Updating_netrw:
" check latest version with :echo g:loaded_netrwPlugin [~v165 ships, ~170 is latest]
" clean existing version:
"   ni http://www.drchip.org/astronaut/vim/vbafiles/netrwclean.vba.gz
"   :packadd vimball
"   :UseVimball ~/.dotfiles/nvim/local-plugs/netrwclean
"   :NetrwClean
" exit vim and then download and install the latest version of netrw:
"   it's not possible to open from the url as netrw is uninstalled :/
"   curl http://www.drchip.org/astronaut/vim/vbafiles/netrw.vba.gz -o ~/Downloads/netrw.vba.gz
"   ni ~/Downloads/netrw.vba.gz
"   :packadd vimball
"   :UseVimball ~/.dotfiles/nvim/local-plugs/netrw
" it should now be picked up by vim-plug (already added, just for info)
"   Plug '~/.dotfiles/nvim/local-plugs/netrw'
"
" Vimplug:-----------------------------------------------------------------{{{1

call plug#begin()
Plug '~/.dotfiles/nvim/local-plugs/netrw'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'junegunn/rainbow_parentheses.vim', {'for': 'clojure'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}

" All for Neotest
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'antoinemadec/FixCursorHold.nvim'
" Plug 'nvim-neotest/neotest'
" Plug 'nvim-neotest/neotest-python'
" Plug 'nvim-neotest/neotest-vim-test'
" All for Neotest

Plug 'folke/neodev.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
"
" Plug 'bhurlow/vim-parinfer', {'for': 'clojure'}
" Plug 'ludovicchabant/vim-gutentags'
Plug 'christoomey/vim-sort-motion'
" Plug 'alfredodeza/pytest.vim', {'for': 'python'}
Plug 'vim-test/vim-test'
Plug 'psf/black'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'ervandew/supertab'
" Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'dyng/ctrlsf.vim'
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
"
" Themes
Plug 'tanvirtin/monokai.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sjl/badwolf' " high contrast
Plug 'veloce/vim-aldmeris' " high contrast
" Plug 'nightsense/forgotten' " low contrast / dark & light
Plug 'nightsense/snow' " light
Plug 'drewtempelmeyer/palenight.vim' " high contrast
Plug 'skielbasa/vim-material-monokai' " high contrast
Plug 'patstockwell/vim-monokai-tasty' " high contrast
Plug 'jnurmine/Zenburn' " low contrast
Plug 'nanotech/jellybeans.vim' " high contrast
call plug#end()

" Basic Settngs:-----------------------------------------------------------{{{1
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
set textwidth=120
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

" Line Numbers:------------------------------------------------------------{{{1
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

" for daytime
colorscheme gruvbox
" colorscheme monokai
" colorscheme material-monokai
" colorscheme palenight
" colorscheme badwolf

" for nighttime
" colorscheme zenburn

" for light theme (never!)
" colorscheme forgotten-light
" let g:airline_theme='snow_dark'

let g:python_highlight_all = 1

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
set fillchars+=diff:╱

" Virtualenv:--------------------------------------------------------------{{{1
" install pynvim, flake8 into this venv
let virtualenv = $HOME.'/venvs/nvim/bin'
let g:python3_host_prog = virtualenv.'/python3'


" Deoplete:----------------------------------------------------------------{{{1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0

" Ale:---------------------------------------------------------------------{{{1
let g:ale_linters = {'python': ['flake8'], 'clojure': ['clj-kondo', 'joker']}
let g:ale_fixers = {}
let g:ale_fixers.python = ['black']
let g:ale_python_flake8_executable = virtualenv.'/flake8'
let g:ale_python_flake8_options = '--max-line-length 120 --ignore W503'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1

" Black:-------------------------------------------------------------------{{{1
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

" Testing:-----------------------------------------------------------------{{{1
" pytest plugin
" let g:pytest_executable = substitute(system("which -a pytest | head -n2 | tail -n1"), "\n", '', 'g')

" vim-test plugin
let test#python#djangotest#options = '--keepdb'
let test#strategy = "neovim"
let g:test#neovim#start_normal = 1



" Lightline:---------------------------------------------------------------{{{1
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" FZF:---------------------------------------------------------------------{{{1
nnoremap <C-p> :Telescope find_files<Cr>
nnoremap <leader>bb :Telescope buffers<Cr>
nnoremap <leader>ff :Telescope live_grep_args<Cr>
nnoremap <leader>fr :Telescope resume<Cr>
nnoremap <leader>fw :Telescope grep_string<Cr>
nnoremap <leader>w :Windows<Cr>
autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

" Jedi:--------------------------------------------------------------------{{{1
let g:jedi#goto_command = "gd"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>gu"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>gr"
let g:jedi#rename_command_keep_name = "<leader>gR"

let g:jedi#show_call_signatures = "1"
let g:jedi#completions_enabled = 0
"
" Rainbow:-----------------------------------------------------------------
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Remappings:--------------------------------------------------------------
" insert blank row
nnoremap <leader>r o<ESC>
nnoremap <leader>R O<ESC>

" navigating between vim tabs and buffers
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>N :tabp<CR>
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
" inoremap <leader>td # TODO:
" nnoremap <leader>td o# TODO:
nnoremap <leader>st Obreakpoint()<ESC>
nnoremap <leader>ip Ofrom IPython import embed; embed()<ESC>
nnoremap <leader>ft :Ag breakpoint<CR>
nnoremap <leader>mp O@mock.patch.object(, '', autospec=True)<ESC>

" pretty print json
nnoremap <leader>jp :%!python -m json.tool<cr>
vnoremap <leader>jp :%!python -m json.tool<cr>

" search for selected text from visual mode
vnoremap // y/<C-R>"<CR>

" search for test of selected text from visual mode
nnoremap <leader>td crmyiwu:Ag <C-R>"Tests<CR>

" current directory useful for !mkdir -p %%
cnoremap %% %:h

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
nnoremap <silent><leader>L :Lexplore<cr>

" testing
nnoremap <leader>ta :TestFile<cr>
nnoremap <leader>tm :TestNearest<cr>
nnoremap <leader>tl :TestLast<cr>
" nnoremap <leader>ta :Pytest file<cr>
" nnoremap <leader>tc :Pytest class<cr>
" nnoremap <leader>tm :Pytest method<cr>
" nnoremap <leader>tf :Pytest function<cr>
" nnoremap <leader>tva :Pytest file verbose<cr>
" nnoremap <leader>tvc :Pytest class verbose<cr>
" nnoremap <leader>tvm :Pytest method verbose<cr>
" nnoremap <leader>tvf :Pytest function verbose<cr>
" nnoremap <leader>te :Pytest next<cr>
" nnoremap <leader>tE :Pytest previous<cr>
" nnoremap <leader>tve :Pytest error<cr>

" execute in python
nnoremap <silent><leader>xp :w ! python<cr>
vnoremap <silent><leader>xp :w ! python<cr>

" create docstring
" nnoremap <leader>ds o"""<esc>oArgs:<esc>oReturns:<esc>oYields:<esc>oRaises:<esc>o"""<esc>5k

" nnoremap gr :Require<cr>

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

" set foldcolumn=2
set foldmethod=syntax
set foldlevelstart=99

" set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
" set grepformat=%f:%l:%c:%m,%f:%l:%m

" ----------------------------- end of vimrc ----------------------------------
lua require('config')
