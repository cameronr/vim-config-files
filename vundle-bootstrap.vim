" From http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand("~/.vim/bundle/Vundle.vim/README.md")
if !filereadable(vundle_readme)
"if !isdirectory("~/.vim/bundle/vundle")
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

" Setting up Vundle - the vim plugin bundler end
