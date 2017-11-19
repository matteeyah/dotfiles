set statusline=
set statusline+=%#CursorColumn#
set statusline+=%(\ %{fugitive#head()}\ %)
set statusline+=%#LineNr#
set statusline+=\ %f\ %h%w%m
set statusline+=%#CursorColumn#
set statusline+=%(\ Q:\ %{substitute(len(getqflist()),'^0','','')}\ %)
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ L%l:C%c
