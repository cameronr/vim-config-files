" Editor
set confirm
set nocompatible
filetype plugin on
set backspace=start,indent,eol
set whichwrap=h,l,~,[,],<,> " allow commands to wrap across lines
syntax on

" Display
set t_Co=256
colorscheme ir_black
set background=dark
set ruler
set bg=dark
set scrolloff=3
set title
set showmatch

" Highlight SQL and HTML in PHP code
let php_sql_query=1                                                                                        
let php_htmlInStrings=1


" Autocomplete/CTAG options

" Enable autocomplete for PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

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
set smartindent
"let g:PHP_BracesAtCodeLevel = 1
set cinwords=if,else,while,do,for,switch,elseif,unless,until,foreach
" don't move # to the far left
inoremap # X<C-H>#

" Tabs
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>
" nmap <C-t> :tabnew<CR>
nmap <C-w> :quit<CR>
ca tn tabnew

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

" Commenting
let g:EnhCommentifyFirstLineMode = 'Yes'  " use the first line in a block rather than each line to decide whether to comment or uncomment
let g:EnhCommentifyTraditionalMode = 'No' " this has to be disabled for above to work 
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyUseBlockIndent = 'Yes'

" Auto-detect .tac files as python
au! BufNewFile,BufRead *.tac set filetype=python
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab


function! RunShebang()
  if (match(getline(1), '^\#!') == 0)
    :!./%
  else
    echo "No shebang in this file."
  endif
endfunction
map <F5> :call RunShebang()<CR>

