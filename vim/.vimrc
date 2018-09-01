""" plugins
source ~/.dotfiles/config/vim/minpac.vim

""" options
set encoding=utf-8 " use unicode encoding
set nobackup " don't use backup files
set nowritebackup " don't use temporary write backup files
set noswapfile " don't use a swap file
set showcmd " display incomplete commands
set showmode " display mode below statusline
set autowrite " automatically :write before running commands
set shiftround " use multiple of shiftwidth when indenting
set list listchars=tab:»·,trail:·,nbsp:· " display extra whitespace
set nojoinspaces " use one space after punctuation
set textwidth=80 " set default text width to 80 characters
set colorcolumn=+1 " color the texwidth +1 column
set scrolloff=5 " keep at least 5 lines when scrolling
set number " show line numbering
set relativenumber " number lines relative to current one
set splitbelow " open splits below
set splitright " open vsplits right
set hlsearch " highlight search results
set showmatch " highlight matching parenthesis
set cursorline " highlight current line
set spelllang=en_us " set spellchecking locale
set wildmenu " use advanced command-line completions
set wildmode=longest:full,full " expand to the longest match, then show wildmenu
set mousehide " hide mouse when typing

if has('clipboard')
  if has('unnamedplus')  " when possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " if + isn't available, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

""" autocommands
" when editing a commit message set cursor position to top line
autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0]) | setlocal spell

""" theme
colorscheme zenburn

""" mappings
let mapleader="," " set <leader> key to <,>
" fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gu :Gpush<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gi :Git add -p %<CR>
" FlyGrep
nnoremap <leader>s :FlyGrep<CR>

""" setup
" grep
if executable("rg")
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
" ale
let g:ale_sign_column_always = 1
" vim-qf
let g:qf_statusline = {}
let g:qf_statusline.before = '%<\ '
let g:qf_statusline.after = '\ %f%=%l\/%-6L\ \ \ \ \ '
" vim-cool
let g:CoolTotalMatches = 1
" FlyGrep
let g:FlyGrep_input_delay = 200
let g:FlyGrep_search_tools = ['rg', 'ag']

""" statusline
source ~/.dotfiles/config/vim/statusline.vim
