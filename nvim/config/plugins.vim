" vim-plug

call plug#begin('~/.config/nvim/plugged')

" Plugin list ------------------------------------------------------------------
"
Plug 'wakatime/vim-wakatime'

Plug 'vim-scripts/Mustang2'
Plug 'Lokaltog/powerline'                 " Powerline fonts plugin

Plug 'challenger-deep-theme/vim', {'name': 'challenger-deep-theme'}
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'luochen1990/rainbow'


" -------------------=== Code/Project navigation ===-------------

Plug 'scrooloose/nerdtree'                " Project and file navigation
Plug 'kien/ctrlp.vim'                     " Fast transitions on project files

Plug 'neovimhaskell/haskell-vim'
Plug 'godlygeek/tabular'
Plug 'achimnol/python-syntax'
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

Plug 'tpope/vim-commentary'               " Comment stuff out

" NERD Commenter plugin.

Plug 'scrooloose/nerdcommenter'

Plug 'w0rp/ale'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'rhysd/committia.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/vim-slash'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'junegunn/vim-easy-align'
Plug 'sgur/vim-editorconfig'

" End plugin list --------------------------------------------------------------

call plug#end()
