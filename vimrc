" Vimrc file, http://phuzz.org

au BufNewFile,BufRead *.mjs             set filetype=javascript

set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching 
"set noignorecase   " don't ignore case
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

set autoindent     " always set autoindenting on
set smartindent        " smart indent
set cindent            " cindent
"set noautoindent
"set nosmartindent
"set nocindent   

"set autowrite      " auto saves changes when quitting and swiching buffer
set expandtab      " tabs are converted to spaces, use only when required
set sm             " show matching braces, somewhat annoying...
set nowrap         " don't wrap lines

syntax on           " syntax highlighing

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    
    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    au FileType cpp,c,java,sh,pl,php,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,asp  set cindent
    "au BufRead mutt*[0-9] set tw=72
    
    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
endif

" Keyboard mappings
" map <F1> :previous<CR>  " map F1 to open previous buffer
" map <F2> :next<CR>      " map F2 to open next buffer
" map <silent> <C-N> :silent noh<CR> " turn off highlighted search
map ,v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map ,e :e ~/.vimrc<cr>      " edit my .vimrc file
map ,u :source ~/.vimrc<cr> " update the system settings from my vimrc file
"----- write out html file
map ,h :source $VIM/vim71/syntax/2html.vim<cr>:w<cr>:clo<cr>

" nnoremap jj <Esc>
" nnoremap jh <C-W><Left>
" nnoremap jl <C-W><Right>

nnoremap gh <c-w><Left>
nnoremap gl <c-w><Right>
nnoremap gj <c-w><Down>
nnoremap gk <c-w><Up>

" like unimpaired [e ]e
nnoremap ]p yyP
nnoremap [p yyp

nnoremap tn :tabedit<CR>
nnoremap tc :tabclose<CR>

nmap <C-n> <c-w><left><down><c-w><c-w>
nmap <C-p> <c-w><left><up><c-w><c-w>
nmap <C-o> <c-w><left><CR>

map cc <leader>c<space>

" Common command line typos
"cmap W w
"cmap Q q

" Keyboard mapping for numeric keypad
"imap <Esc>OM <c-m>
" map <Esc>OM <c-m>
"imap <Esc>OP <nop>
" map <Esc>OP <nop>
"imap <Esc>OQ /
" map <Esc>OQ /
"imap <Esc>OR *
" map <Esc>OR *
"imap <Esc>OS -
" map <Esc>OS -

"imap <Esc>Ol +
"imap <Esc>Om -
"imap <Esc>On ,
"imap <Esc>Op 0
"imap <Esc>Oq 1
"imap <Esc>Or 2
"imap <Esc>Os 3
"imap <Esc>Ot 4
"imap <Esc>Ou 5
"imap <Esc>Ov 6
"imap <Esc>Ow 7
"imap <Esc>Ox 8
"imap <Esc>Oy 9
"imap <Esc>Oz 0

function! Dos2Unix()
    set ff=unix
    write ++ff=unix
endfunc

function! Unix2Dos()
    set ff=dos
    write ++ff=dos
endfunc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'wincent/command-t'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'gmarik/Vundle.vim'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'tomasr/molokai'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
" NERDtree options
"
" convenient to have a hotkey for the NERDtree
nnoremap <F4> :NERDTreeToggle<CR>
" open up a NERDtree at startup if there are no files provided (which is
" almost always, given that mvim causes hangs on Lion.
autocmd vimenter * if !argc() | NERDTree | endif
" autoquit if NERDtree is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

Plugin 'majutsushi/tagbar'
" Tagbar options
nnoremap <F8> :TagbarToggle<CR>
" jsctags isn't ready, and ctags needs help
let g:tagbar_type_javascript = {
  \ 'ctagstype' : 'javascript',
  \ 'replace'   : 1,
  \ 'kinds'     : [
    \ 'e:exports',
    \ 'v:global variables',
    \ 'C:constants',
    \ 'c:classes',
    \ 'm:methods',
    \ 'f:functions',
    \ 'p:properties'
  \ ]
\ }


Plugin 'airblade/vim-gitgutter'
" syntystic
Plugin 'vim-syntastic/syntastic'
" Syntastic options
" let g:syntastic_debug = 63
" let g:syntastic_debug_file = '~/syntastic.log'
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_mode_map = { "mode": "active",
                           \ 'active_filetypes': ['go', 'haskell', 'ocaml',
                           \    'ruby', 'python', 'yaml',
                           \    'javascript', 'json', 'less',
                           \    'puppet'],
                           \ 'passive_filetypes': [] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:airline_powerline_fonts = 1

Plugin 'heavenshell/vim-jsdoc'
let g:jsdoc_access_descriptions = 1
let g:jsdoc_underscore_private = 1
let g:jsdoc_enable_es6 = 1

Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
set nofoldenable
set foldmethod=manual

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set background=dark        " adapt colors for background
colorscheme molokai
let g:molokai_original = 1
