"" Install vim-plug if not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')
"
" Appearence
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'

" utilities
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
"Plug 'tpope/vim-commentary' " comment stuff out
" Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
" Plug 'tpope/vim-endwise' " automatically add end in ruby
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
" Plug 'neomake/neomake' " neovim replacement for syntastic using neovim's job control functonality
" Plug 'benjie/neomake-local-eslint.vim' "Prefer local repo install of eslint over global install
"Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
"Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
"Plug 'editorconfig/editorconfig-vim' " .editorconfig support
"Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
"Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
"Plug 'tpope/vim-vinegar' " netrw helper
"Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'ntpeters/vim-better-whitespace'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
"Plug 'tell-k/vim-autopep8'
"Plug 'Chiel92/vim-autoformat'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" JavaScript
"Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
"Plug 'moll/vim-node', { 'for': 'javascript' } " node support
"Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
"Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
"Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support
Plug 'posva/vim-vue'

" html / templates
Plug 'mattn/emmet-vim' " emmet support for vim - easily create markdup wth CSS-like syntax

" language-specific plugins
"Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
"Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
"Plug 'fatih/vim-go', { 'for': 'go' } " go support
"Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support
"Plug 'kchmck/vim-coffee-script' " CoffeeScript
"Plug 'davidhalter/jedi-vim'  "Using the jedi autocompletion library for VIM (python)
Plug 'lervag/vimtex'
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'vim-pandoc/vim-rmarkdown'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'

" Linters
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Chiel92/vim-autoformat'  "Beautifier Prettifier - run :Autoformat <language>

" Docs
"Plug 'rizzatti/dash.vim'

" CSV
"Plug 'chrisbra/csv.vim'

"" snippets
" Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

"" Syntax highlight
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

""" Tagbar replacement for LSP
Plug 'liuchengxu/vista.vim'

""" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" :Rename
Plug 'tpope/vim-eunuch'

"" Initialize plugin system
call plug#end()
