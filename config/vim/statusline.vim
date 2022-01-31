set statusline=
set statusline+=%#StatusLine#
set statusline+=%(\ %{gitbranch#name()}\ %)
set statusline+=%#Normal#
set statusline+=\ %f\ %h%w%m
set statusline+=%#StatusLine#
set statusline+=%(\ Q:\ %{substitute(len(getqflist()),'^0','','')}\ %)
set statusline+=%=
set statusline+=%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ L%l:C%c
