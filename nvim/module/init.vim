call plug#begin('~/.config/nvim/plugged')

exec "source " vimpath . "appearance.vim"
exec "source " vimpath . "editing.vim"
exec "source " vimpath . "go.vim"
exec "source " vimpath . "navigation.vim"
exec "source " vimpath . "projects.vim"
exec "source " vimpath . "python.vim"
exec "source " vimpath . "searching.vim"

call plug#end()
