Plug 'Lokaltog/powerline'                 " Powerline fonts plugin

Plug 'challenger-deep-theme/vim', {'name': 'challenger-deep-theme'}
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'luochen1990/rainbow'
PLug 'ryanoasis/vim-devicons'

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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" If we have 24bit colour support, use it. Without this line we seem to get
" the right colours *almost* - except the background!
if has('nvim') || has('termguicolors')
  set termguicolors
endif
