" START VUNDLE CONFIGURATION
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set foldmethod=manual
set dir=~/.vimtmp

let g:syntastic_javascript_checkers = ['eslint']

let NERDTreeIgnore = ['\.pyc$', '\.php\~$']

" Autosave when focus is lost
:au FocusLost * :wa

source ~/.vim/php-doc.vim
inoremap <C-Z> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-Z> :call PhpDocSingle()<CR>
vnoremap <C-Z> :call PhpDocRange()<CR>
inoremap <D-s> <ESC>:w<CR>a
nnoremap <D-s> :w<CR>

" Allow per-project vimrc
set exrc

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

" Reopen last closed window that was in split
nmap <c-s-t> :vs<bar>:b#<CR>

" Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Conquer of Completion
Plug 'neoclide/coc.nvim'

call plug#end()

" let Vundle manage Vundle. Required!
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:

" Gruvbox color scheme
Plugin 'morhetz/gruvbox'

" Vue Plugin
Plugin 'posva/vim-vue'

" Handlebars and Mustache templates
Plugin 'mustache/vim-mustache-handlebars'

" CamelCase motion
Plugin 'bkad/CamelCaseMotion'

" Pug (Jade) syntax highlighting
Plugin 'https://github.com/digitaltoad/vim-pug'

" Typescript syntax
Plugin 'https://github.com/leafgarland/typescript-vim'

" Typescript syntax highlight for contents in Template Strings
Plugin 'Quramy/vim-js-pretty-template'

" Markdown preview
Plugin 'JamshedVesuna/vim-markdown-preview'

" Debugger client
Plugin 'joonty/vdebug'

" Python indentation
Plugin 'vim-scripts/indentpython.vim'

" Ruby support
Plugin 'git@github.com:vim-ruby/vim-ruby.git'

" Rails support
Plugin 'git@github.com:tpope/vim-rails.git'

" Enable configuration file of each directory
Plugin 'thinca/vim-localrc'

" themes and statusbars
"Plugin 'altercation/vim-colors-solarized'
Plugin 'Yggdroot/indentLine'
"Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Plugin to udnerstand .editorconfig files
Plugin 'editorconfig/editorconfig-vim'

" Session management
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

" Recover from existing swap files
Plugin 'chrisbra/Recover.vim'

" Buffer management
Plugin 'jeetsukumaran/vim-buffergator'

" Improved incremental searching
Plugin 'haya14busa/incsearch.vim'

" Alignment and regions
Plugin 'junegunn/vim-easy-align'
Plugin 'chrisbra/NrrwRgn'

" Numbering and git
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'esneider/YUNOcommit.vim'

" Automagically adds closing quotes and braces
" Easily Add, change and delete surroundings
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'

" Filesystem tree (with search capability) and code commenter
Plugin 'lgnstn/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/nerdtree-ack'
Plugin 'mileszs/ack.vim'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'othree/yajs.vim'

" Syntax checker
Plugin 'scrooloose/syntastic'

" TAB for autocompletion
"Plugin 'ervandew/supertab'

" Snippets
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

" Full path fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

" Single line and multi line navigation
Plugin 'Lokaltog/vim-easymotion'
Plugin 'justinmk/vim-sneak'

" Open URI with browser
Plugin 'tyru/open-browser.vim'

" This Vim plugin will search for terms using the excellent Dash.app
Plugin 'rizzatti/dash.vim'

" Expand Abbreviation
Plugin 'mattn/emmet-vim'

" Previewing markup files
Plugin 'greyblake/vim-preview'


Plugin 'kchmck/vim-coffee-script'

" PHP doc blocks
Bundle 'tobyS/pdv'
"
"
" Brief help " :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update
"                   - or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
"                   - append `!` to auto-approve removal
"
"
" see :h vundle for more details or wiki for FAQ

"
" END VUNDLE CONFIGURATION
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Change the mapleader default key to ','
let mapleader = ","

call camelcasemotion#CreateMotionMappings('<leader>')

" PHP XDebug
let g:vdebug_options = {
      \ 'port' : 9005,
      \ 'server' : '',
      \ 'path_maps': {
        \ '/var/www/partfiniti': '/Users/iustin/Sites/partfiniti/api/web'
      \ }
      \}
let g:vdebug_options.break_on_open = 0
let g:vdebug_keymap = {
       \   "run" : "<F5>",
       \   "run_to_cursor" : "<C-p>",
       \   "step_over" : "<C-o>",
       \   "step_into" : "<C-i>",
       \   "step_out" : "<C-o>",
       \   "close" : "<C-x>",
       \   "detach" : "<C-z>",
       \   "set_breakpoint" : "<F10>",
       \   "get_context" : "<C-y>",
       \   "eval_under_cursor" : "<C-e>",
       \   "eval_visual" : "<Leader>e",
       \}
"

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undo

" Load coc.nvim config
source ~/.vim/coc.nvim.vim

" Markdown preview key
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" JSX syntax in js files
let g:jsx_ext_required = 0

syntax enable
set enc=utf-8
set background=dark

if has('gui_running')
    " Enable the solarized theme
    " colorscheme vendettacursor
    " color solarized
    " color zenburn
    color gruvbox

    " Enable Spell Checking
    set spell
endif

" Set Auto-indent options
set cindent
set smartindent
set autoindent

set nowrap
set number

" Set Tabs and spacing globally
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd FileType javascript set tabstop=2 | set softtabstop=2 | set shiftwidth=2
autocmd FileType html set tabstop=2 | set softtabstop=2 | set shiftwidth=2
autocmd FileType ruby set tabstop=2 | set softtabstop=2 | set shiftwidth=2

" Show a status bar
set ruler
set laststatus=2
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

" Set Search options highlight, and wrap search
set hls is " highlight search text throughout the document.
set wrapscan " wrap the scan around the document
set ic "ignore case in search

" PDV - PHP Documentor
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-a> :call pdv#DocumentWithSnip()<CR>

" Incremental searching
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Custom shortcuts
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>a

map <F3> :tabnew<CR>
imap <F3> <ESC>:tabnew<CR>

map <F5> :tabprev<CR>
imap <F5> <ESC>:tabprev<CR>a

map <F6> :tabnext<CR>
imap <F6> <ESC>:tabnext<CR>a

nmap <F8> <F2>:!php "%<.php"<CR>
imap <F8> <F2><ESC>:!php "%<.php"<CR>

nmap <F9> <F2>:!g++ -O2 -W -Wall -Wno-unused-function -lm -o "%<" "%<.cpp"; time ./"%<"<CR>
imap <F9> <F2><ESC>:!g++ -O2 -W -Wall -Wno-unused-function -lm -o "%<" "%<.cpp"; time ./"%<"<CR>

" Nerd Tree shortcut
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Split's manipulation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" 81 characters vertical resize key binding
noremap <Leader>vr <C-w>=<CR> :vertical resize 85<CR>

" window resizing
map <S-Left> <C-w><
map <S-Down> <C-w>-
map <S-Up> <C-w>+
map <S-Right> <C-w>>

" Show lines that exceed 80 characters
match ErrorMsg '\%>80v.\+'

" Highlight the columns from 81 to 120
execute 'set colorcolumn=' . join(range(81,120),',')
autocmd Filetype php execute 'set colorcolumn=' . join(range(121,140),',')
autocmd Filetype phtml execute 'set colorcolumn=' . join(range(301,340),',')

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Remove trailing sapces
autocmd BufWritePre * :%s/\s\+$//e

" Use ack-grep instead of ack
let g:ackprg="ack-grep -H --smart-case --nocolor --nogroup --column"

" first set path
set path+=**

" Paste toggle
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode

" Set default base number as 10
set nrformats=

" Disable working path mode. Keep the first root.
let g:ctrlp_working_path_mode = 0

" Exclude some files from ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*~,*.zip,*/cache/*
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" Change default key for easy motion
let g:EasyMotion_leader_key = '<Leader>'

" Allow counts for vim-seek
let g:seek_subst_disable = 1

" Cut, copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+"

" Symfony2 command shell
map <leader>c :!./app/console -s<CR>

" Disabling the cursor/arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Open Browser configuration
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)

"Autocomplete shortcuts
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

"Dash bindings
:nmap <silent> <leader>da <Plug>DashSearch

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %

" Vim session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 1
let g:session_default_to_last = 1
let g:session_command_aliases = 1

"Configure tags plugin to use tags.vendors and local tags
set tags+=./tags.vendors,tags.vendors,.git/tags,./tags,tags;$HOME
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Set the number of writes without committing before the message is shown
let g:YUNOcommit_after = 200

"Buffer manager configuration
let g:buffergator_suppress_keymaps = 1
nmap <silent> <C-b> :BuffergatorToggle<CR>

" Show sign column
set signcolumn=auto

"Disable scroll bars
:set guioptions-=l
:set guioptions-=L
:set guioptions-=r
:set guioptions-=R

"Scroll the window with 10 lines around
set scrolloff=5

"IndentLine config
let g:indentLine_char = '.'

" Reload ~/.vimrc key binding
noremap <Leader>rv :source ~/.vimrc<CR>

" Enable the expansion of <CR>
let delimitMate_expand_cr = 2

" Reveal current file in tree
noremap <leader>n :NERDTreeFind<CR>

" Press Space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Do no scan included files - Supertab
"set complete-=i

autocmd vimenter * colorscheme gruvbox

set secure
