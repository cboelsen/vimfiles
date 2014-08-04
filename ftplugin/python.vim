map <F12> :!ctags -f ~/.vim/tagstore/tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q `python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"` .<CR>
