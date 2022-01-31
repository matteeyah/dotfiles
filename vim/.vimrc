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
  if has('unnamedplus') " when possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else " if + isn't available, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

""" theme
colorscheme zenburn

""" setup
" grep
if executable("rg")
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
" vim-cool
let g:CoolTotalMatches = 1
" vim-sneak
let g:sneak#label = 1
" vim-qf
let g:qf_statusline = {}
let g:qf_statusline.before = '%<\ '
let g:qf_statusline.after = '\ %f%=%l\/%-6L\ \ \ \ \ '

""" FileType
" git - when editing a commit message set cursor position to top line and enable spellchecking
autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0]) | setlocal spell
" ruby

""" statusline
source ~/.dotfiles/config/vim/statusline.vim
