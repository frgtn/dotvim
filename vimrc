set nocompatible
filetype off

if has("eval")
    call plug#begin("~/.vim/bundle")

    " Bundles
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'ctrlpvim/ctrlp.vim'
    " Plug 'localtag/vim-powerline'
    Plug 'tpope/vim-fugitive'
    if has('nvim') || has('timers') && exists('*job_start') && exists('*ch_close_in')
        Plug 'w0rp/ale'
    endif
    Plug 'nathanaelkane/vim-indent-guides'

    Plug 'scrooloose/NERDTree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFocus', 'NERDTreeFind'] }

    Plug 'editorconfig/editorconfig-vim'
    Plug 'airblade/vim-gitgutter'

    Plug 'majutsushi/tagbar'
    nmap <F8> :TagbarToggle<CR>

    Plug 'sjl/gundo.vim'
    let g:gundo_prefer_python3 = has('python3')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='solarized'
    if has('py3')
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    endif

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " Colorschemes
    Plug 'altercation/vim-colors-solarized'

    " Language plugins
    Plug 'hdima/python-syntax'
    Plug 'mako.vim'
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'puppetlabs/puppet-syntax-vim'
    Plug 'tpope/vim-markdown'
    Plug 'rust-lang/rust.vim'
    Plug 'django.vim'
    Plug 'lunaru/vim-less'
    Plug 'digitaltoad/vim-jade'
    Plug 'kchmck/vim-coffee-script'
    Plug 'xmledit'
    Plug 'hashivim/vim-terraform'
    Plug 'mfukar/robotframework-vim'
    Plug 'mitsuhiko/vim-jinja'
    Plug 'pearofducks/ansible-vim'

    " Extras
    Plug 'mgedmin/coverage-highlight.vim'
    let g:coverage_script = 'env/bin/python3 -m coverage'

    call plug#end()
endif

filetype plugin indent on

" Other configuration
let maplocalleader=','

set background=light
colorscheme solarized

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

set tags=./tags;$HOME

" edit/view file in same directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

set encoding=utf-8

" Disable arrow keys
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

" Support mouse reporting in iTerm2
if has('mouse_sgr')
    set ttymouse=sgr
endif

" Language specific options
autocmd FileType python setlocal sw=4 sts=4 et
autocmd FileType ruby,haml,eruby,yams,sass,mako,mason,js,jade,coffee,scss,jsx,yaml setlocal ai sw=2 sts=2 et

" CommandT settings
set wildignore+=*.pyc,*.pyo,*.class,node_modules/*,*/node_modules/*,bower_components/*,env/*,venv/*,.env/*,*.egg-info,jspm_packages/*,report/*,deploy/env/*,eggs/*
let g:CommandTMatchWindowAtTop=1

" Allow JSX syntax in .js files
let g:jsx_ext_required = 0


" VIM-Airline settings
set laststatus=2

set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*

" Open NERDTree if no file is selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree

" Ale!
let g:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_args = '-m flake8'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" Ignore some false positive errors that rustc returns when checking
" as-you-type. Unfortunately not all errors can be ignored, see
" https://github.com/rust-lang/rust/issues/39542
let g:ale_rust_ignore_error_codes = ['E0432', 'E0433']

set updatetime=250  " faster CursorHold events for vim-gitgutter
