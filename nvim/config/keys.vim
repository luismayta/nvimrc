let g:mapleader=","                         " settings leader to ,

"" Break bad habits - no arrow keys!
"=====================================================
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <Leader>n :call NumberToggle()<cr>

" Map leader s to save.
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
