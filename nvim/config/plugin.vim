call plug#begin(vimpath . '/plugged')
" Plugin list ------------------------------------------------------------------
"

Plug 'sgur/vim-editorconfig'
Plug 'wakatime/vim-wakatime'

Plug 'vim-scripts/Mustang2'

" -------------------=== Code/Project navigation ===-------------


Plug 'neovimhaskell/haskell-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'spoqa/nirum.vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'elmcast/elm-vim'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'tomlion/vim-solidity'
Plug 'pdurbin/vim-tsv'
Plug 'PProvost/vim-ps1'
Plug 'rhysd/vim-github-actions'

" -------------------=== Languages support ===-------------------


Plug 'w0rp/ale'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'rhysd/committia.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-slash'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'junegunn/vim-easy-align'

" appearance

Plug 'Lokaltog/powerline'                 " Powerline fonts plugin

Plug 'challenger-deep-theme/vim', {'name': 'challenger-deep-theme'}
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'luochen1990/rainbow'

Plug 'https://github.com/ryanoasis/vim-devicons'

" editing
Plug 'tpope/vim-commentary'               " Comment stuff out

" NERD Commenter plugin.

Plug 'scrooloose/nerdcommenter'

" projects
Plug 'scrooloose/nerdtree'                " Project and file navigation
Plug 'kien/ctrlp.vim'                     " Fast transitions on project files

" python
Plug 'achimnol/python-syntax'

" searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
