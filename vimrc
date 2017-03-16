""" plugin manager
call plug#begin()

" install plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimproc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline'

call plug#end()

""" basics
set colorcolumn=80 " mark the 80th column
set number " number lines
let mapleader=" " " set <leader> key to <SPACE>
set expandtab " insert spaces instead of tabs
set shiftwidth=2
set softtabstop=2
set smartindent " smart indentation
set hidden " hide buffers instead of closing them
set hlsearch " highlight search results
set showmatch " highlight matching parenthesis
" Cancel out of a search with <ESC>
nmap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" sane window switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

if has('gui_running')
        """ font
        set guifont=Fira\ Code:h15
        set macligatures
endif

""" theme
set background=dark
colorscheme solarized

""" vim-airline
let g:airline_powerline_fonts = 1

""" NERDTree
nmap <leader>n :NERDTreeToggle<CR> " <leader> + N to open NERDTree

""" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" tagbar
nmap <leader>t :TagbarToggle<CR>

""" easymotion
" <Leader>f{char} to move to {char}
nmap  <Leader>f <Plug>(easymotion-bd-f)

" Move to line
nmap <Leader>L <Plug>(easymotion-bd-jk)

" Move to word
nmap  <Leader>w <Plug>(easymotion-bd-w)

""" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby compiler ruby
