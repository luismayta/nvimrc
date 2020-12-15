"set-directory
let g:vimpath=fnamemodify(resolve(expand('<sfile>:p')), ':h')

"source the vimrc in the current directory if it is there
if filereadable(getcwd() . "/.vim")
  execute ":source " . getcwd() . "/.vim"
endif

exec "source " vimpath . "/config/init.vim"
exec "source " vimpath . "/module/init.vim"

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

"ALE-related configurations.
let g:ale_linters = {
\   'haskell': ['stack-ghc-mod', 'hlint'],
\   'rust': ['cargo'],
\}
let b:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"Markdown-related configurations.
augroup mkd
  autocmd BufRead *.markdown set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkdn     set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkd      set formatoptions=tcroqn2 comments=n:> spell
augroup END

"Elm format
let g:elm_format_autosave = 1


"vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"VimShell
let g:vimshell_prompt_expr = '$USER . " " . fnamemodify(getcwd(), ":~") . " $ "'
let g:vimshell_prompt_pattern = '^[a-z_-][a-z0-9_-]\{,31\} [~/][^$ ]* $ '
