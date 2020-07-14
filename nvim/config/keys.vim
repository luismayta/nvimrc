let g:mapleader=","                         " settings leader to ,

"" Break bad habits - no arrow keys!
"=====================================================
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"=====================================================
"" NERDTree settings
"=====================================================

" Toggle NerdTree with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Open NerdTree automatically on startup.
" Also focus the *previous* window, i.e. the main window!
" autocmd vimenter * NERDTree | wincmd p

let NERDTreeShowHidden=1 " Show or hide hidden files.

let NERDTreeWinSize=40

" But still ignore some normally not needed files.
let g:NERDTreeIgnore=['\.git$[[dir]]', 'node_modules$[[dir]]', '\.nyc_output$[[dir]]', '\.pyc$', '\.pyo$', '__pycache__$']

" Show the current file in NERDTree.
map <leader>t :NERDTreeFind<cr>

nnoremap <Leader>n :call NumberToggle()<cr>

" Map leader s to save.
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>