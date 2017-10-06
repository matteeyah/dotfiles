" load plugins
source ~/.dotfiles/vim/plug.vim

""" basics
set backspace=2 " backspace deletes in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set showcmd " display incomplete commands
set autowrite " automatically :write before running commands
set shiftround " use multiple of shiftwidth when indenting
set list listchars=tab:»·,trail:·,nbsp:· " display extra whitespace
set nojoinspaces " use one space after punctuation
set textwidth=80
set colorcolumn=+1
set number
" open splits below and righ
set splitbelow
set splitright
set hlsearch " highlight search results
set showmatch " highlight matching parenthesis

""" theme
if has('gui_running')
        " font config
        set guifont=Fira\ Code:h15
        set macligatures
endif
set background=dark
colorscheme solarized

let mapleader="," " set <leader> key to <,>
" toggles
nmap <leader>tt :TagbarToggle<CR>
" easymotion
" Move to char
nmap <leader>ec <Plug>(easymotion-overwin-f)
" Move to line
nmap <leader>el <Plug>(easymotion-overwin-line)
" Move to word
nmap <leader>ew <Plug>(easymotion-overwin-w)
" git
nmap <leader>gs :Gstatus<CR>
nmap <leader>gp :Gpull<CR>
nmap <leader>gu :Gpush<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gb :Gblame<CR>
