" ====================================================
" Global configuration
" ====================================================

set autowrite                       " Save automatically all the buffers in vim
set autochdir                       " Set the working directory
set colorcolumn=81                  " Set the 80 character column
set cursorline                      " Highlight the current line
"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
set hidden                          " Any buffer can be hidden
set history=1000                    " Set a huge history
set linespace=0                     " No extra spaces between rows
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
set relativenumber                  " set the number in vim
set scrolljump=5                    " Lines to scroll when cursor leaves screen
set scrolloff=3                     " Minimum lines to keep above and below cursor
set showmatch                       " Show current brackets
set splitbelow                      " Puts new split windows to the bottom of the current
set splitright                      " Puts new vsplit windows to the right of the current
set winminheight=0                  " Windows can be 0 line height

" Fuzzy matching
set path+=**                       " fuzzy matching with :find *.ext*
set wildmenu                       " Show list instead of just completing
set wildignore+=**/node_modules/** " Ignore some folders
set wildignore+=**/.git/**
set wildignore+=**/build/**
set wildignore+=**/dist/**

" Folding
" set nofoldenable      " Auto fold code
set foldmethod=syntax " Fold are defined by syntax highlighting

"Syntax highlighting.
syntax on               " required

" Indentation
" Don't enable smarindent or cindent with filetype plugin indent on
filetype plugin indent on   " Indentation based on filetype
set autoindent              " Does not interfere with other indentation settings

" Mouse
set mouse=a

"No compatibility to traditional vi
set nocompatible

"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4

set backspace=2

"More tabs
set tabpagemax=25

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

"Detect modeline hints.
set modeline
