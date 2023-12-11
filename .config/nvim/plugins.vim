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
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'

" html / templates
Plug 'mattn/emmet-vim' " emmet support for vim - easily create markdup wth CSS-like syntax

" language-specific plugins
Plug 'lervag/vimtex'
Plug 'Vimjas/vim-python-pep8-indent'

" Linters
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Chiel92/vim-autoformat'  "Beautifier Prettifier - run :Autoformat <language>

"" snippets
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

Plug 'nvim-telescope/telescope-frecency.nvim'

" GraphQL
Plug 'jparise/vim-graphql'

"" Initialize plugin system
call plug#end()
