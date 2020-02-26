" set up minpac
packadd minpac
call minpac#init()

" install plugins
call minpac#add('k-takata/minpac', {'type': 'opt'}) " package manager

call minpac#add('tpope/vim-sensible') " sensible defaults
call minpac#add('tpope/vim-sleuth') " automatically set tab width
call minpac#add('tpope/vim-surround') " motions for surrounding pairs
call minpac#add('tpope/vim-fugitive') " git
call minpac#add('tpope/vim-vinegar') " file navigation with -
call minpac#add('tpope/vim-commentary') " easy commenting
call minpac#add('tpope/vim-dispatch') " async command execution
call minpac#add('tpope/vim-eunuch') " wrapper for shell commands
call minpac#add('tpope/vim-unimpaired') " paired mappings
call minpac#add('tpope/vim-projectionist') " project file types configuration

call minpac#add('airblade/vim-gitgutter') " gutter git signs
call minpac#add('easymotion/vim-easymotion') " special navigation motion
call minpac#add('jnurmine/Zenburn') " color scheme
call minpac#add('keith/rspec.vim') " rspec syntax
call minpac#add('romainl/vim-qf') " quickfix mappings
call minpac#add('romainl/vim-cool') " interactive search match count

set rtp+=/usr/local/opt/fzf
call minpac#add('junegunn/fzf.vim') " fuzzy file finder

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()
