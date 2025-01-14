source ~/.config/nvim/plugins.vim
:if !empty(glob("~/.config/nvim/local.vim"))
:  source ~/.config/nvim/local.vim
:endif

" Appearance
set termguicolors
let g:solarized_termcolors=256
"set background=light
"colorscheme atom
colorscheme onedark
"colorscheme solarized
"set guifont= "make sure to escape the spaces in the name properly

" Settings
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
set tabstop=4 shiftwidth=2 expandtab
set number
"set relativenumber
set showcmd
set autoread

" Some shortcuts
let mapleader = " "
nnoremap <Leader>q :q<CR>
nnoremap tt :tabnew<CR>
"imap <C-e> <C-y>,   " emmet shortcut
nnoremap <Leader>w :w<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
nnoremap <Leader>l :VimuxRunLastCommand<CR>
nnoremap <Leader>m :VimuxRunCommand ""<Left>

" NERDTree
let NERDTreeIgnore = ['\.pyc$']
nmap <silent> <Leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <Leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" FZF
let g:fzf_layout = { 'down': '~25%' }

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Tags
"nmap <silent> <Leader>t :CtrlPBufTag<cr>
nmap <silent> <Leader>t :Windows<cr>

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

" airline options
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep=''
"let g:airline_right_sep=''
let g:airline_theme='onedark'
"let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
"let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" save as sudo
ca w!! w +!sudo tee "%"

" ctrl + s save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" navigate windows with arrows
map <Right> <c-w>l
map <Left> <c-w>h
map <Up> <c-w>k
map <Right> <c-w>l
map <Down> <c-w>j

" enable system clipboard for, er, system clipboard registers
" https://github.com/neovim/neovim/issues/583#issuecomment-272350992
set mouse=a

" show whitespace
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
:set listchars=trail:~,extends:>,precedes:<
":set list

" darker bg better contrast
hi Normal ctermbg=none

" ctrl+k ctrl+j switch tabs
map <c-k> gt
map <c-j> gT

:set colorcolumn=72,80,119
:highlight ColorColumn ctermbg=235 guibg=#2c2d27

" latex
let g:vimtex_latexmk_progname='nvr'
 let g:vimtex_view_method='skim'
"let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname='nvr'

:command Templatecpp :r ~/.config/nvim/templates/cpp | :norm ggdd4ji	

nmap <leader>h :!npx eslint --fix %<cr>
nmap <silent> <leader>d <Plug>DashSearch

nmap <c-x> !pipenv run make html

" textwidth (for docstring mainly with gqq)
set tw=72

" snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" coc.nvim
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show errors or warnings window (quickfix window)
"nmap <leader>i :CocDiagnostics<cr>
nmap <leader>n :CocNext<cr>
nmap <leader>N :CocPrev<cr>
nmap <silent> <leader>i :CocList diagnostics<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-rust-analyzer']

au BufNewFile,BufRead *.ts setlocal filetype=typescript

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Word count
function WordCount()
  let s:old_status = v:statusmsg
  exe "silent normal g\<c-g>"
  let s:word_count = str2nr(split(v:statusmsg)[11])
  let v:statusmsg = s:old_status
  return s:word_count
endfunction
":set statusline=wc:%{WordCount()}


autocmd FileType python let b:coc_root_patterns = ['.ccls']

" Find files using Telescope command-line sugar.
nnoremap <leader>p :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


nnoremap <leader>c :Format<CR>

nmap <leader>rn <Plug>(coc-rename)

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd User CocStatusChange redraws

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

let g:ledger_bin = 'ledger'

command! TwoColumns
        \   exe "normal zR"
        \ | set noscrollbind
        \ | vsplit
        \ | set scrollbind
        \ | wincmd w
        \ | exe "normal \<c-f>"
        \ | set scrollbind
        \ | wincmd p

function! s:Camelize(range) abort
  if a:range == 0
    s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g
  else
    s#\%V\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)\%V#\u\1\2#g
  endif
endfunction

function! s:Snakeize(range) abort
  if a:range == 0
    s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g
  else
    s#\%V\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)\%V#\l\1_\l\2#g
  endif
endfunction

command! -range CamelCase silent! call <SID>Camelize(<range>)
command! -range SnakeCase silent! call <SID>Snakeize(<range>)
