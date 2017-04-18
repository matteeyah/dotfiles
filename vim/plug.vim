""" plugin manager
call plug#begin()

" install plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
