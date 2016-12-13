set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
Plugin 'gmarik/Vundle.vim'
Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'Command-T'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'localtag/vim-powerline'
Plugin 'AutoTag'
Plugin 'tpope/vim-fugitive'
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/NERDTree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'

" Colorschemes
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/Wombat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'wimstefan/Lightning'
Plugin 'alexjgriffin/sprinkles'

" Plugin 'unite.vim'

" Language plugins
Plugin 'hdima/python-syntax'
Plugin 'derekwyatt/vim-scala'
Plugin 'Haskell-Highlight-Enhanced'
Plugin 'indenthaskell.vim'
Plugin 'mako.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'tpope/vim-markdown'
Plugin 'rust-lang/rust.vim'
Plugin 'django.vim'
Plugin 'lunaru/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'xmledit'
Plugin 'hashivim/vim-terraform'
Plugin 'mfukar/robotframework-vim'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

" Other configuration
let maplocalleader=','

set hidden
set scrolloff=5
set title
set showcmd
set backspace=indent,eol,start

set nowritebackup
set noswapfile " May not be that smart actually
set nobackup
set timeoutlen=250

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set number
set nowrap
set vb
set noerrorbells  " No noise.
set t_vb=

set splitbelow
set splitright

set background=light
colorscheme solarized

set tags=./tags;$HOME

" edit/view file in same directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Powerline settings
set laststatus=2
set encoding=utf-8

" Disable arrow keys
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

" Language specific crap
autocmd FileType python setlocal sw=4 sts=4 et
autocmd FileType ruby,haml,eruby,yams,sass,mako,mason,js,jade,coffee,scss,jsx,yaml setlocal ai sw=2 sts=2 et

" CommandT settings
set wildignore+=*.pyc,*.pyo,*.class,node_modules/*,*/node_modules/*,bower_components/*,env/*,venv/*,.env/*,*.egg-info,jspm_packages/*,report/*,deploy/env/*,eggs/*
let g:CommandTMatchWindowAtTop=1

" Allow JSX syntax in .js files
let g:jsx_ext_required = 0


set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*

" Syntastic stuffs
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_flake8_exe = 'python3 -m flake8'
let g:syntastic_python_python_exec = 'python3'

" Ale!
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_args = '-m flake8'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

autocmd BufReadPre,BufNewFile **/bolagsfakta/**/* let g:syntastic_javascript_checkers = ['eslint']
autocmd BufReadPre,BufNewFile **/bolagsfakta/**/* let g:syntastic_javascript_eslint_exec = 'client/eslint'

autocmd BufReadPre,BufNewFile **/manoseimas/**/* let g:syntastic_javascript_checkers = ['eslint']
autocmd BufReadPre,BufNewFile **/manoseimas/**/* let g:syntastic_javascript_eslint_exec = './eslint'

set updatetime=250  " faster CursorHold events for vim-gitgutter
