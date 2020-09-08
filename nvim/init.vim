"set-directory
let g:vimpath=fnamemodify(resolve(expand('<sfile>:p')), ':h')

"source the vimrc in the current directory if it is there
if filereadable(getcwd() . "/.vim")
  execute ":source " . getcwd() . "/.vim"
endif

exec "source " vimpath . "/config/keys.vim"
exec "source " vimpath . "/config/global.vim"
exec "source " vimpath . "/config/plugins.vim"
exec "source " vimpath . "/module/init.vim"
exec "source " vimpath . "/config/colors.vim"

" python path
let g:python3_host_prog = '$HOME/.pyenv/shims/python'

"Syntax highlighting.
syntax on

set autoindent nosmartindent

"set tab characters apart
set listchars=tab:↹\

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

set backspace=2

"Detect modeline hints.
set modeline

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"More tabs
set tabpagemax=25

filetype plugin on

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.scss setfiletype scss
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less

"These languages have their own tab/indent settings.
au FileType cpp    setl ts=2 sw=2 sts=2
au FileType ruby   setl ts=2 sw=2 sts=2
au FileType yaml   setl ts=2 sw=2 sts=2
au FileType html   setl ts=2 sw=2 sts=2
au FileType jinja  setl ts=2 sw=2 sts=2
au FileType lua    setl ts=2 sw=2 sts=2
au FileType haml   setl ts=2 sw=2 sts=2
au FileType sass   setl ts=2 sw=2 sts=2
au FileType scss   setl ts=2 sw=2 sts=2
au FileType make   setl ts=4 sw=4 sts=4 noet
au FileType rst    setl spell
au FileType gitcommit setl spell

"Terminal-related configurations.
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l

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

"Python-related configurations.
"See also: https://github.com/achimnol/python-syntax#options-used-by-the-script
let python_highlight_builtins = 1
let python_highlight_type_annotations = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_string_format = 1
let python_highlight_string_templates = 0
let python_highlight_indent_errors = 1
let python_highlight_space_errors = 0
let python_highlight_doctests = 1

"Markdown-related configurations.
augroup mkd
  autocmd BufRead *.markdown set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkdn     set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkd      set formatoptions=tcroqn2 comments=n:> spell
augroup END

"Haskell-related config
let g:haskell_quasi         = 0
let g:haskell_interpolation = 0
let g:haskell_regex         = 0
let g:haskell_jmacro        = 0
let g:haskell_shqq          = 0
let g:haskell_sql           = 0
let g:haskell_json          = 0
let g:haskell_xml           = 0
let g:haskell_hsp           = 0

"Elm format
let g:elm_format_autosave = 1

"English spelling checker.
setlocal spelllang=en_us

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

"Mundo -- Undo tree visualization
set undofile
set undodir=~/.config/nvim/undo
nnoremap <F5> :MundoToggle

"Use Vimfiler as default explorer like netrw
let g:vimfiler_as_default_explorer = 1

"deoplete
let g:deoplete#enable_at_startup = 1

"vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"VimShell
let g:vimshell_prompt_expr = '$USER . " " . fnamemodify(getcwd(), ":~") . " $ "'
let g:vimshell_prompt_pattern = '^[a-z_-][a-z0-9_-]\{,31\} [~/][^$ ]* $ '

"Alias :W to :w
cnoreabbrev W w
