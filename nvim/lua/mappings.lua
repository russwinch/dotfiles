require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Leader shortcuts for vscode-neovim (using VSCodeNotify)
if vim.g.vscode then
  -- Git operations (VSCode integration)
  vim.cmd [[
    " Navigate changes
    nnoremap <leader>gn <Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>
    nnoremap <leader>gN <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>
    " Preview hunk inline (shows inline diff preview)
    nnoremap <leader>gp <Cmd>call VSCodeNotify('editor.action.dirtydiff.next')<CR>
    " Open diff view
    nnoremap <leader>gP <Cmd>call VSCodeNotify('git.openChange')<CR>
    " Stage/unstage hunks (select hunk first, or use visual mode)
    nnoremap <leader>gs <Cmd>call VSCodeNotify('git.stageSelectedRanges')<CR>
    vnoremap <leader>gs <Cmd>call VSCodeNotify('git.stageSelectedRanges')<CR>
    nnoremap <leader>gu <Cmd>call VSCodeNotify('git.unstageSelectedRanges')<CR>
    vnoremap <leader>gu <Cmd>call VSCodeNotify('git.unstageSelectedRanges')<CR>
    " Revert changes
    nnoremap <leader>gr <Cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>
    vnoremap <leader>gr <Cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>
    " Git view
    nnoremap <leader>gv <Cmd>call VSCodeNotify('workbench.view.scm')<CR>
    " Stage/unstage all
    nnoremap <leader>gS <Cmd>call VSCodeNotify('git.stageAll')<CR>
    nnoremap <leader>gU <Cmd>call VSCodeNotify('git.unstageAll')<CR>
    
    " Testing
    nnoremap <leader>ta <Cmd>call VSCodeNotify('python.testing.runAllTests')<CR>
    nnoremap <leader>tt <Cmd>call VSCodeNotify('python.testing.runCurrentTest')<CR>
    nnoremap <leader>tc <Cmd>call VSCodeNotify('python.testing.runTestAtCursor')<CR>
    
    " Error navigation
    nnoremap <leader>en <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
    nnoremap <leader>ep <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
  ]]
else
  -- Git operations (non-vscode: use gitsigns)
  local gitsigns = require("gitsigns")
  map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
  map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Unstage hunk" })
  map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
  map("n", "[c", gitsigns.prev_hunk, { desc = "Previous hunk" })
  map("n", "]c", gitsigns.next_hunk, { desc = "Next hunk" })
  map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
  map("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line" })
  
  -- Diffview keymaps
  map("n", "<leader>gd", function() require("diffview").open() end, { desc = "Open diffview" })
  map("n", "<leader>gc", function() require("diffview").close() end, { desc = "Close diffview" })
end

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--
vim.cmd [[
" SuperTab:----------------------------------------------------------------{{{1
"let g:SuperTabDefaultCompletionType = "<c-n>" "set order of options to down
" let g:SuperTabClosePreviewOnPopupClose = 1

" File Explorer:-----------------------------------------------------------{{{1
" open in a split with :Vex
" open in previous window with P
" resume exploring with :Rex
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_winsize = 25

" Git:---------------------------------------------------------------------{{{1
" reduce the lag between vimgutter updates
"set updatetime=100
" command! Gadiff Ghdiff :1:% | Gvdiff!<CR>
"set fillchars+=diff:╱

" Virtualenv:--------------------------------------------------------------{{{1
" install pynvim, flake8 into this venv
"let virtualenv = $HOME.'/venvs/nvim/bin'
"let g:python3_host_prog = virtualenv.'/python3'


" Deoplete:----------------------------------------------------------------{{{1
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#jedi#enable_typeinfo = 0

" Ale:---------------------------------------------------------------------{{{1
"let g:ale_linters = {'python': ['flake8'], 'clojure': ['clj-kondo', 'joker']}
"let g:ale_fixers = {}
"let g:ale_fixers.python = ['black']
"let g:ale_python_flake8_executable = virtualenv.'/flake8'
"let g:ale_python_flake8_options = '--max-line-length 120 --ignore W503'
"let g:ale_sign_error = '⤫'
"let g:ale_sign_warning = '⚠'
"let g:ale_sign_column_always = 1

" Black:-------------------------------------------------------------------{{{1
"augroup black_on_save
  "autocmd!
  "autocmd BufWritePre *.py Black
"augroup end

" Testing:-----------------------------------------------------------------{{{1
" pytest plugin
" let g:pytest_executable = substitute(system("which -a pytest | head -n2 | tail -n1"), "\n", '', 'g')

" vim-test plugin
"let test#python#djangotest#options = '--keepdb'
"let test#strategy = "neovim"
"let g:test#neovim#start_normal = 1

" FZF:---------------------------------------------------------------------{{{1
"nnoremap <C-p> :Telescope find_files<Cr>
"nnoremap <leader>bb :Telescope buffers<Cr>
"nnoremap <leader>ff :Telescope live_grep_args<Cr>
"nnoremap <leader>fr :Telescope resume<Cr>
"nnoremap <leader>fw :Telescope grep_string<Cr>
"nnoremap <leader>w :Windows<Cr>
"autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

" Jedi:--------------------------------------------------------------------{{{1
"let g:jedi#goto_command = "gd"
"let g:jedi#goto_assignments_command = "<leader>ga"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>gu"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>gr"
"let g:jedi#rename_command_keep_name = "<leader>gR"
"
"let g:jedi#show_call_signatures = "1"
"let g:jedi#completions_enabled = 0
"
" Rainbow:-----------------------------------------------------------------
"augroup rainbow_lisp
"  autocmd!
"  autocmd FileType lisp,clojure,scheme RainbowParentheses
"augroup END

" Remappings:--------------------------------------------------------------
" insert blank row
nnoremap <leader>r o<ESC>
nnoremap <leader>R O<ESC>

" cancel highlight
nnoremap <silent> <leader>hh :nohl<cr>

" use relative numbering
" nnoremap <leader>u <ESC>:set relativenumber!<CR><ESC>
" inoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>i

" pretty print json
nnoremap <leader>jp :%!python -m json.tool<cr>
vnoremap <leader>jp :%!python -m json.tool<cr>

" search for selected text from visual mode
vnoremap // y/<C-R>"<CR>

" toggle left explorer
nnoremap <silent><leader>L :NvimTreeToggle<cr>

" search for test of selected text from visual mode
"nnoremap <leader>td crmyiwu:Ag <C-R>"Tests<CR>

" navigating between vim tabs and buffers
"nnoremap <leader>tn :tabnew<CR>
"nnoremap <leader>n :tabn<CR>
"nnoremap <leader>N :tabp<CR>
"nnoremap <leader>tt :tabedit %<CR>
"" nnoremap <leader>bn :bn<CR>
"" nnoremap <leader>bp :bp<CR>
"
"" reload all buffers with syntax highlighting
"nnoremap <leader>br :execute 'bufdo :e' <bar> source $VIMRUNTIME/syntax/syntax.vim<cr>
"
"
"" open vimrc in a tab for a quick edit
"nnoremap <leader>ve :tabe $MYVIMRC<cr>
"" source the vimrc file
"nnoremap <leader>vs :source $MYVIMRC<cr>
"
"
"" navigate between splits
"nmap <silent><Space> <C-w>w
"
"" copy and paste
"vnoremap <leader>c "*y
"inoremap <leader>c "*yy
"nnoremap <leader>c "*yy
"inoremap <leader>v <ESC>"*pa
"inoremap <leader>V <ESC>"*Pa
"nnoremap <leader>v "*p
"nnoremap <leader>V "*P
"
"" snippets
"" inoremap <leader>td # TODO:
"" nnoremap <leader>td o# TODO:
"nnoremap <leader>st Obreakpoint()<ESC>
"nnoremap <leader>ip Ofrom IPython import embed; embed()<ESC>
"nnoremap <leader>ft :Ag breakpoint<CR>
"nnoremap <leader>mp O@mock.patch.object(, '', autospec=True)<ESC>
"
"" current directory useful for !mkdir -p %%
"cnoremap %% %:h
"
"" navigate through errors
"nnoremap <leader>e :ALENext<cr>
"nnoremap <leader>E :ALEPrevious<cr>
"nnoremap <silent>]e :ALENext<cr>
"nnoremap <silent>[e :ALEPrevious<cr>
"nnoremap <silent>[E :ALEFirst<cr>
"nnoremap <silent>]E :ALELast<cr>
"
"" update all git guttters after a commit
"nnoremap <leader>gg :GitGutterAll<cr>
"
"" open 4 way git diff
"nnoremap <leader>gd :Gsplit :1:%<cr> <C-w>W :Gvdiff!<cr>
"
"" remove trailing white spaces from lines
"nnoremap <leader>tw :%s/\s\+$//e<cr>


" testing
"nnoremap <leader>ta :TestFile<cr>
"nnoremap <leader>tm :TestNearest<cr>
"nnoremap <leader>tl :TestLast<cr>
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
]]
