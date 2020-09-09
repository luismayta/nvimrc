" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
"=====================================================
"" NERDTree settings
"=====================================================

" Toggle NerdTree with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Show the current file in NERDTree.
map <leader>t :NERDTreeFind<cr>

" Open NerdTree automatically on startup.
" Also focus the *previous* window, i.e. the main window!
" autocmd vimenter * NERDTree | wincmd p

let NERDTreeShowHidden=1 " Show or hide hidden files.

let NERDTreeWinSize=40

" But still ignore some normally not needed files.
let g:NERDTreeIgnore=['\.git$[[dir]]', 'node_modules$[[dir]]', '\.nyc_output$[[dir]]', '\.pyc$', '\.pyo$', '__pycache__$']

let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''
