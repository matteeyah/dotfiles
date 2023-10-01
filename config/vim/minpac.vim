" set up minpac
packadd minpac
call minpac#init()

" install plugins
call minpac#add('k-takata/minpac', {'type': 'opt'}) " package manager

call minpac#add('tpope/vim-endwise') " automaticly add matching keywords
call minpac#add('tpope/vim-eunuch') " UNIX commands wrappers
call minpac#add('tpope/vim-projectionist') " easy related file navigation
call minpac#add('tpope/vim-rails') " projectionist setup for rails
call minpac#add('tpope/vim-sensible') " sensible defaults
call minpac#add('tpope/vim-sleuth') " automatically set tab width
call minpac#add('tpope/vim-surround') " motions for surrounding pairs
call minpac#add('tpope/vim-commentary') " easy commenting
call minpac#add('tpope/vim-unimpaired') " paired mappings

call minpac#add('github/copilot.vim')
call minpac#add('itchyny/vim-gitbranch') " git branch without fugitive
call minpac#add('jnurmine/Zenburn') " color scheme
call minpac#add('justinmk/vim-dirvish') " better file navigator
call minpac#add('justinmk/vim-sneak') " jump motion
call minpac#add('keith/rspec.vim') " rspec syntax
call minpac#add('romainl/vim-qf') " quickfix mappings
call minpac#add('romainl/vim-cool') " interactive search match count

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()
