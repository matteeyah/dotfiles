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

""" MUCopmlete
set completeopt+=menuone,noinsert,preview
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1
autocmd CompleteDone * pclose
" clang_complete
let g:clang_library_path='/usr/local/opt/llvm/lib/libclang.dylib'
let g:clang_complete_auto = 1

let mapleader="," " set <leader> key to <,>
" cancel out of a search with <ESC>
nmap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" sane window switching
nmap <c-h> :wincmd h<CR>
nmap <c-j> :wincmd j<CR>
nmap <c-k> :wincmd k<CR>
nmap <c-l> :wincmd l<CR>
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
nmap <leader>gl :Glog<CR>
nmap <leader>gb :Gblame<CR>

nmap <leader>ff :Files<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fa :Ag<CR>
