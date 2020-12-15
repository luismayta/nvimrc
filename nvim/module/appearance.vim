" dracula settings
:syntax on
colorscheme dracula

let g:dracula_bold=1
let g:dracula_italic=1
let g:dracula_underline=1
let g:dracula_undercurl=1
let g:dracula_inverse=1
let g:dracula_colorterm=1

" color settings after dracula
hi! Normal ctermbg=NONE
hi! NonText ctermbg=NONE
hi! Normal guibg=NONE
hi! NonText guibg=NONE

" colorscheme onedark

" lightline
let g:lightline = { 'colorscheme': 'dracula' }

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

" Undo tree
let g:undotree_SetFocusWhenToggle=1
"Mundo -- Undo tree visualization
set undofile
set undodir=~/.config/nvim/undo
nnoremap <F5> :MundoToggle

"Keep 80 columns.
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd WinEnter * match OverLength /\%81v.\+/

"gVim-specific configurations (including MacVim).
if has("gui_running")
  set bg=dark
  set guioptions=egmrLt
  set linespace=1
  set number
endif
