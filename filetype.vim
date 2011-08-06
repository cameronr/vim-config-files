" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
au BufNewFile,BufReadPost *.hdf setf hdf
au BufNewFile,BufReadPost *.cs setf cs 
au BufNewFile,BufReadPost *.py setf python
augroup END
