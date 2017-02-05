"
" START VUNDLE CONFIGURATION
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let g:syntastic_javascript_jshint_args = '--config /Users/iustin/.jshintrc'
set foldmethod=manual

" let Vundle manage Vundle. Required!
Plugin 'gmarik/vundle'

" My Plugins here:

" Ruby support
Plugin 'git@github.com:vim-ruby/vim-ruby.git'

" Rails support
Plugin 'git@github.com:tpope/vim-rails.git'

" Enable configuration file of each directory
Plugin 'thinca/vim-localrc'

" themes and statusbars
Plugin 'altercation/vim-colors-solarized'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Plugin to udnerstand .editorconfig files
Plugin 'editorconfig/editorconfig-vim'

" View images in Vim
Plugin 'ashisha/image.vim'

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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/nerdtree-ack'
Plugin 'mileszs/ack.vim'

" PHP Autocomplete
Plugin 'vim-scripts/AutoTag'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'arnaud-lb/vim-php-namespace'

" PHPUnit
Plugin 'joonty/vim-phpunitqf'

" PHP Documentor
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'

" Symfony
Plugin 'stocarul/vim-symfony'

" Javascript
Plugin 'isRuslan/vim-es6'
Plugin 'othree/yajs.vim'

" Syntax checker
Plugin 'scrooloose/syntastic'

" Supports twig PHP templates
Plugin 'evidens/vim-twig'

" TAB for autocompletion
Plugin 'ervandew/supertab'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'algotech/ultisnips-php'
Plugin 'algotech/ultisnips-javascript'

" Full path fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

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

filetype plugin indent on     " required!
"
"
" Brief help
" :PluginList       - lists configured plugins
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
"

" Change the mapleader default key to ','
let mapleader = ","

syntax enable
set enc=utf-8
set background=dark

if has('gui_running')
    " Enable the solarized theme
    colorscheme solarized

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

" Set Search options highlight, and wrap search
set hls is " highlight search text throughout the document.
set wrapscan " wrap the scan around the document
set ic "ignore case in search

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
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Open Browser configuration
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)

" PHP Documentor configuration
let g:pdv_template_dir = $HOME ."/.vim/pdv/templates_snip"
map <Leader>d :call pdv#DocumentWithSnip()<CR>

"Autocomplete shortcuts
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

"Run unit test when saving a test file
:autocmd BufWritePost *Test.php :Test %

"Dash bindings
:nmap <silent> <leader>da <Plug>DashSearch

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

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

"Configure tags plugin to use tags.vendors
set tags+=./tags.vendors,tags.vendors

"Namespace mappings
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>

"Set the number of writes without committing before the message is shown
let g:YUNOcommit_after = 200

"Buffer manager configuration
let g:buffergator_suppress_keymaps = 1
nmap <silent> <C-b> :BuffergatorToggle<CR>

"Disable scroll bars
:set guioptions-=l
:set guioptions-=L
:set guioptions-=r
:set guioptions-=R

"Scroll the window with 10 lines around
set scrolloff=10

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
