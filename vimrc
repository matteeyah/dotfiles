" load plugins
source ~/.dotfiles/vim/plug.vim

""" basics
let mapleader=" " " set <leader> key to <SPACE>
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
set numberwidth=5
" open splits below and righ
set splitbelow
set splitright
set hlsearch " highlight search results
set showmatch " highlight matching parenthesis
" cancel out of a search with <ESC>
nmap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

""" theme
if has('gui_running')
        " font config
        set guifont=Fira\ Code:h15
        set macligatures
endif
set background=dark
colorscheme solarized

""" mappings
" sane window switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
" tagbar
nmap <leader>t :TagbarToggle<CR>
" easymotion
" Move to char
map <leader>f <Plug>(easymotion-bd-d)
nmap <leader>f <Plug>(easymotion-overwin-f)
" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)
" Move to word
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

""" vim-airline
let g:airline_powerline_fonts = 1

""" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
