" be iMproved, required
set nocompatible

filetype off

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" let g:python3_host_prog = expand('~/.vim/python-venv/bin/python3')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Autosuggest
Plug 'girishji/autosuggest.vim'

" fuzzy file finder
Plug 'kien/ctrlp.vim'

" Buffer manager
"Plug 'jeetsukumaran/vim-buffergator'

" Baller status line
Plug 'vim-airline/vim-airline'

" my custom theme
Plug 'cameronr/vim-airline-murmur-muted'

" nice color scheme
Plug 'altercation/vim-colors-solarized'

" bracketed paste (no more set paste!)
Plug 'ConradIrwin/vim-bracketed-paste'

" git integration
Plug 'tpope/vim-fugitive'

" git viewer
Plug 'gregsexton/gitv'

" Gradle highlighting
Plug 'tfnico/vim-gradle'

" comment plugin
Plug 'tomtom/tcomment_vim'

" autotag plugin
Plug 'craigemery/vim-autotag'

" docker plugin
Plug 'ekalinin/Dockerfile.vim'

" salt plugin
Plug 'saltstack/salt-vim'

" coffeescript plugin
Plug 'kchmck/vim-coffee-script'

" javascript plugins
    " better indentation/syntax support
    Plug 'pangloss/vim-javascript'
    " jsx support
    Plug 'mxw/vim-jsx'
    " enhanced syntax highlighting
    Plug 'jelera/vim-javascript-syntax'

" Highlight/strip whitespace
Plug 'ntpeters/vim-better-whitespace'

" Thrift plugin
Plug 'solarnz/thrift.vim'

" Ack search tool
Plug 'mileszs/ack.vim'

" Dart support
Plug 'dart-lang/dart-vim-plugin'

" Flutter
Plug 'thosakwe/vim-flutter'

" Liquid (shopify)
Plug 'tpope/vim-liquid'

" All of your Plugins must be added before the following line
call plug#end()

" another escape option
imap jk <Esc>

" Editor
set encoding=utf-8
set confirm
filetype plugin indent on
set backspace=start,indent,eol
set whichwrap=h,l,~,[,],<,> " allow commands to wrap across lines
syntax on
" set visualbell
set laststatus=2

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Display
set background=dark

" Solarized color scheme settings
" Make it display nicely in Mac OS Terminal
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized

set ruler
set scrolloff=3
set title
set showmatch

" Highlight SQL and HTML in PHP code
let php_sql_query=1
let php_htmlInStrings=1


" Select the longest text and display the menu
set completeopt=longest,menu

" Open tag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Find tags file in previous directories, stopping at our home directory
set tags=./tags;$HOME

" Search
set wrapscan
set incsearch
set ignorecase
set hlsearch
set smartcase " case-sensitive search if search contains uppercase
set gdefault  " assume /g flag is on for replacement (all in line)

" Formatting
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set softtabstop=2
" set smartindent
"let g:PHP_BracesAtCodeLevel = 1
set cinwords=if,else,while,do,for,switch,elseif,unless,until,foreach
" don't move # to the far left
inoremap # X<C-H>#

" Tabs
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>

" Folding
set foldlevel=0
set foldmethod=marker
set foldnestmax=1
set foldminlines=3
map f za
map <C-j> zj
map <C-k> zk

" Text replacement
abbr teh the
abbr hte the

" Menu mode
set wildmenu
set wildmode=list:longest

" Auto-detect .tac files as python
au! BufNewFile,BufRead *.tac set filetype=python
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab

" make :W also write to file
command! W write

" make :Q also quit to file
command! Q quit

"====== OLD Neocomplete config =================================

" " Enable Neocomplete https://github.com/Shougo/neocomplcache.vim
" let g:acp_enableAtStartup = 0
" " Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" " limit number of completions
" let g:neocomplcache_max_list = 10
"
"
" " Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }
"
" " Define keyword.
" if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   " return neocomplcache#smart_close_popup()
"   " For no inserting <CR> key.
"   return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" " Close popup by <Space>.
" "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
"
" " For cursor moving in insert mode(Not recommended)
" " inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
" " inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" " inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" " inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" " Or set this.
" " let g:neocomplcache_enable_cursor_hold_i = 1
" " Or set this.
" " Don't pop up menu when navigating with arrow keys
" let g:neocomplcache_enable_insert_char_pre = 1
"
" " AutoComplPop like behavior.
" "let g:neocomplcache_enable_auto_select = 1
"
" " Shell like behavior(not recommended).
" "set completeopt+=longest
" "let g:neocomplcache_enable_auto_select = 1
" "let g:neocomplcache_disable_auto_complete = 1
" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
" " " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"
"
" " Enable heavy omni completion.
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"====== OLD Neocomplete config =================================
"
" make drop down menu easier to read
highlight Pmenu ctermbg=7 ctermfg=8 guibg=#606060 guifg=#dddd00
highlight PmenuSel ctermbg=12 ctermfg=6 guifg=#dddd00 guibg=#1f82cd

" == Deoplete Config ==
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" ==


" CtrlP: open new windows in new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" TComment: setup familiar hotkey for comment toggle (\x)
noremap \x :TComment<cr>

" git settings
autocmd Filetype gitcommit setlocal spell textwidth=72

" config airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
 let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_inactive_collapse = 1
let g:airline_theme = 'murmur_muted'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" vim-better-whitespace config
let g:strip_whitespace_on_save=1

" vim-jsx
let g:jsx_ext_required = 0

" javascript indentation
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab


" make ag work better
let g:ackprg = 'ag --vimgrep'

" fix editing crontabs on MacOS
autocmd filetype crontab setlocal nobackup nowritebackup
