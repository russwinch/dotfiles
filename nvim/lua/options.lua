require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

-- History
vim.opt.history = 500

-- Join spaces (false = nojoinspaces)
vim.opt.joinspaces = false

-- Override NvChad options that don't work well with vscode-neovim
if vim.g.vscode then
  -- vscode-neovim forces these, so we override NvChad defaults:
  vim.opt.laststatus = 0  -- NvChad sets to 3, but vscode handles statusline
  vim.opt.showmode = false  -- vscode handles mode display
  vim.opt.cursorline = false  -- can cause display issues in vscode
  vim.opt.fillchars = {}  -- UI chars don't render properly
  vim.opt.mouse = ""  -- vscode handles mouse
  vim.opt.ruler = false  -- vscode handles ruler
  vim.opt.signcolumn = "no"  -- vscode handles signs
  vim.opt.swapfile = false  -- vscode-neovim forces this anyway
  vim.opt.undofile = false  -- can cause file locking issues
end
--
--

vim.cmd [[
syntax enable
set shortmess+=Iw
set list
set showbreak=↳\
set visualbell
"set cursorline
set title

" spell checking for git commits
autocmd FileType gitcommit setlocal spell

" Tabs, spaces and wrapping
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set textwidth=120
"set colorcolumn=+1

" Splits and buffers - feels more natural
"set splitbelow
"set splitright
"set hidden



" diff is vertical by default
" set diffopt+=vertical

" live substitute preview. change to split if changes are off screen
set inccommand=nosplit

" Line Numbers:------------------------------------------------------------{{{1
:set number relativenumber

":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END




let g:python_highlight_all = 1

" Finding and autocomplete:------------------------------------------------{{{1
set showmatch

" dont show the annoying completion window
" set completeopt=menu,longest

" add spelling completion when spellcheck is activated
set complete=.,w,b,u,t,i,kspell

]]
