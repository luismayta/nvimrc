"No compatibility to traditional vi
set nocompatible

"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4

"relative numbers
set rnu

"macvim without scroll bars
set guioptions=

"font
set guifont=FuraCode\ Nerd\ Font:h16.5

"MacVim-specific configurations.
if has("gui_macvim")
  set imd
endif

"cursor highlight
set cursorline

"share clipboard
set clipboard+=unnamed

"I dislike folding.
set nofoldenable

"I dislike visual bell as well.
set novisualbell

"Disable bell
set visualbell t_vb=

if has("macunix")
  language en_US
else
  language en_US.utf8
endif
