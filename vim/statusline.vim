set statusline=
set statusline+=%#CursorColumn#
set statusline+=\ %{fugitive#head()}\ 
set statusline+=%#LineNr#
set statusline+=\ %f\ %m
set statusline+=%#CursorColumn#
set statusline+=\ Q:\ %{len(getqflist())}\ 
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
