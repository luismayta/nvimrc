call plug#begin(vimpath . '/plugged')
" Plugin list ------------------------------------------------------------------
"

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

Plug 'wakatime/vim-wakatime'

Plug 'vim-scripts/Mustang2'

" -------------------=== Code/Project navigation ===-------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
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

Plug 'hashivim/vim-terraform'
Plug 'w0rp/ale'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-slash'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'junegunn/vim-easy-align'

" searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" appearance

Plug 'Lokaltog/powerline'                 " Powerline fonts plugin
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'luochen1990/rainbow'

Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'myusuf3/numbers.vim' " Numbers.vim


" editing

Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'scrooloose/nerdcommenter' " NERDCommenter : Better comments in vim

" projects

Plug 'Shougo/denite.nvim' " Denite for helm feature and better implementation that Unite
Plug 'dunstontc/projectile.nvim' "Projectile

Plug 'mbbill/undotree' " UndoTree : See all undos

" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Go
Plug 'zchee/deoplete-go', { 'do': 'make' }

" JavaScript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Python
Plug 'zchee/deoplete-jedi'

" Jedi vim : Python completition
" Don't forget to install this : sudo pip install jedi
Plug 'davidhalter/jedi-vim'

" python
Plug 'achimnol/python-syntax'


call plug#end()
