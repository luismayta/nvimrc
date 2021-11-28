" Section: Vim, autocomplete
" ------------------------

" auto match pairs for codes
Plug 'jiangmiao/auto-pairs'

Plug 'tabnine/YouCompleteMe'
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_clangd_binary_path='clangd'

" set tab as autocomplete
imap <Tab> <C-y>

" completions, from http://robots.thoughtbot.com/post/27041742805/vim-you-complete-me
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
