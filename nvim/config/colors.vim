colorscheme challenger_deep

" lightline
let g:lightline = { 'colorscheme': 'challenger_deep' }

"vim-airline
let g:airline_powerline_fonts = 1

"True colors
if $TERM_PROGRAM == "iTerm.app" || has("gui_vimr")
  set termguicolors
  set background=dark
else
  set background=dark
endif