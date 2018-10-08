"=============================================
" Initialization
"=============================================

" Load plug
call plug#begin('~/.config/nvim/bundle')

Plug '1995eaton/vim-better-css-completion', { 'for': 'css' }
Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
Plug 'AndrewRadev/gapply.vim'
Plug 'Wolfy87/vim-enmasse'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'gregsexton/MatchTag'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak'
Plug 'kopischke/vim-fetch'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', { 'for': 'html,erb,eruby' }
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mtth/scratch.vim'
Plug 'mustache/vim-mustache-handlebars', { 'for': 'hbs,js,handlebars' }
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'tpope/vim-abolish'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/matchit.zip'
Plug 'vimwiki/vimwiki'
Plug 'wellle/targets.vim'
Plug 'w0rp/ale'
Plug 'itspriddle/vim-marked', { 'for': 'markdown,vimwiki' }
Plug 'jiangmiao/auto-pairs'
Plug 'pbrisbin/vim-colors-off'

call plug#end()

" Load plugins
filetype plugin indent on

"=============================================
" Options
"=============================================

" Color
set termguicolors
syntax on

" Search
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,full
set wildignore=*.swp,*.o,*.so,*.exe,*.dll

" Scroll
set scrolloff=3

" Tab settings
set ts=2
set sw=2
set expandtab

" Hud
set ruler
set number
set nowrap
set fillchars=vert:\│
set colorcolumn=80

" Buffers
set hidden

" Backup Directories
set backupdir=~/.config/nvim/backups,.
set directory=~/.config/nvim/swaps,.
if exists('&undodir')
  set undodir=~/.config/nvim/undo,.
endif

"=============================================
" Remaps
"=============================================

let mapleader=','
let maplocalleader=','

" No arrow keys
map <Left>  :echo "ಠ_ಠ"<cr>
map <Right> :echo "ಠ_ಠ"<cr>
map <Up>    :echo "ಠ_ಠ"<cr>
map <Down>  :echo "ಠ_ಠ"<cr>

" Jump key
nnoremap ` '
nnoremap ' `

" Change pane
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Turn off search highlight
nnoremap <localleader>/ :nohlsearch<CR>

" Trim trailing whitespace
nnoremap <localleader>tw m`:%s/\s\+$//e<CR>``

"=============================================
" Other Settings
"=============================================

" Use relative line numbers
set relativenumber

" Toggle paste mode
set pastetoggle=<leader>z

" Fancy tag lookup
set tags=./tags;/,tags;/

" Fancy macros
nnoremap Q @q
vnoremap Q :norm @q<cr>


" Visible whitespace
set listchars=tab:»·,trail:·
set list


" Soft-wrap for prose
command! -nargs=* Wrap set wrap linebreak nolist spell
let &showbreak='↪ '


"=============================================
" Package Settings
"=============================================
" junegunn/fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_action = {
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit'
\ }
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
nnoremap <c-p> :FZF<cr>
nnoremap <localleader><space> :Buffers<cr>

" junegunn/limelight.vim
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

function! GoyoBefore()
  silent !tmux set status off
  set tw=78
  Limelight
  color off
endfunction

function! GoyoAfter()
  silent !tmux set status on
  set tw=0
  Limelight!
  color gruvbox
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
nnoremap <Leader>m :Goyo<CR>

" junegunn/vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" majutsushi/tagbar
nmap <F9> :TagbarToggle<CR>

" mileszs/ack.vim
let g:ackprg = 'rg --vimgrep --no-heading'

" morhetz/gruvbox
let g:gruvbox_italic=1
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='fg'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='medium'
set background=dark
colorscheme gruvbox

" simnalamburt/vim-mundo
nnoremap <F3> :MundoToggle<CR>

" tpope/vim-markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" vim-airline/vim-airline
let g:airline_powerline_fonts=1
let g:bufferline_echo = 0
let airline#extensions#default#section_use_groupitems = 0

" vim-airline/vim-airline-themes
let g:airline_theme = 'gruvbox'

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/eab', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" w0rp/ale
let g:ale_lint_delay = 5000
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {'javascript': ['eslint']}

" itspriddle/vim-marked
nnoremap <Leader>M :MarkedOpen<CR>