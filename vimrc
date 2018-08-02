" Vundle setup

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'chrisbra/Colorizer'
Plugin 'bling/vim-airline'
Plugin 'tikhomirov/vim-glsl'
Plugin 'peterhoeg/vim-qml'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'vim-scripts/edc-support'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-signify'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/grep.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'lervag/vimtex'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rhysd/vim-clang-format'

if version < 800
    Plugin 'nvie/vim-flake8'
    Plugin 'scrooloose/syntastic'

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0

    let g:syntastic_python_flake8_args = "--max-line-length=119"
    let g:syntastic_warning_symbol="⚠"
    let g:syntastic_error_symbol="✗"
    let g:syntastic_enable_signs=1
    let g:syntastic_python_checkers = ["flake8"]
    let g:syntastic_javascript_checkers = ['eslint']

    function! PipInstall()
        !pip install --upgrade --no-deps .
    endfunction
else
    Plugin 'w0rp/ale'

    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
    " Write this in your vimrc file
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 0
    " You can disable this option too
    " if you don't want linters to run on opening a file
    let g:ale_lint_on_enter = 1

    let g:ale_python_flake8_args = "--max-line-length=119"

    let g:ale_cpp_clangtidy_checks = ['*', '-fuchsia-default-arguments']
    let g:ale_cpp_clangtidy_options = '-extra-arg=-std=c++17'

    Plugin 'fatih/vim-go'

    Plugin 'skywind3000/asyncrun.vim'

    function! s:compile_and_run()
        exec 'w'
        if &filetype == 'c'
            exec "AsyncRun! gcc % -o %<; time ./%<"
        elseif &filetype == 'cpp'
            exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
        elseif &filetype == 'java'
            exec "AsyncRun! javac %; time java %<"
        elseif &filetype == 'sh'
            exec "AsyncRun! bash %"
        elseif &filetype == 'python'
            exec "AsyncRun! python %"
        elseif &filetype == 'go'
            exec "AsyncRun! go build && go test -cover ./..."
        endif
    endfunction

    " Quick run via <F5>
    nnoremap <F5> :call <SID>compile_and_run()<CR>

    augroup SPACEVIM_ASYNCRUN
        autocmd!
        " Automatically open the quickfix window
        autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
    augroup END

    function! PipInstall()
        AsyncRun pip install --upgrade --no-deps .
    endfunction

    noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>
endif

" ctrlp.vim    grep    gundo.vim

call vundle#end()

command Pip execute ":call PipInstall()"

" Finished setting up Vundle

filetype plugin indent on

" turn syntax highlighting on
set t_Co=256
syntax on
colorscheme ir_black

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Keep undo history between buffer switches
set hidden

set completeopt=menu,longest,preview

set noswapfile

set foldmethod=indent
set foldlevel=99

" configure tabwidth and insert spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4
set shiftround  " round indent to multiple of 'shiftwidth'
let c_space_errors = 2

" Search while typing.
set incsearch

"Change so paste commands match indent level
map p ]p
map P ]P

"Save when focus is lost
:au FocusLost * :wa

" Maps scroll the left and right
map H zh
map L zl

" I'm lazy, so map comma to colon
map , :

"Maps ctrl+n to go to next buffer
:nnoremap <C-n> :w<CR> :bnext<CR>

"maps ctrl+p to go to previous buffer
:nnoremap <C-p> :w<CR> :bprevious<CR>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>
" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>
" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>
" Maps Alt-c with close window
map <silent> <A-c> :clo<CR>
map <silent> <A-d> :BD<CR>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" in normal mode F2 will save the file
nmap <F2> :wa<CR>

" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"When F6 is pressed, the list of current buffers appears,
"then you are prompted with the list of open files to which you can choose the
"number
:nnoremap <F6> :buffers<CR>:buffer<Space>

" goto definition with F11
map <F11> <C-]>

set laststatus=2

" clang format
let g:clang_format#code_style = 'chromium'
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" " if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

" Sytastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

if version >= 800
    set statusline+=%{ALEGetStatusLine()}
endif

let g:colorizer_auto_filetype='css,html'

let g:signify_vcs_list = ['git', 'hg']
let g:signify_update_on_bufenter = 0

let g:jsx_ext_required = 0  " Allow JSX in normal JS files

let g:vimtex_view_general_viewer = "lesspipe.sh"

nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" map the Grep command to F10
set grepprg=grep\ -nH\ $*
nnoremap <silent> <F10> :Grep -r --exclude=doxygen*.* --exclude-dir=node_modules
            \ --include=*.c --include=*.h --include=*.cpp --include=*.hpp --include=wscript
            \ --include=*.js --include=*.jsx
            \ --include=*.py
            \ --include=*.edc
            \ <CR>

nmap <F8> :TagbarToggle<CR>

" This offers intelligent C++ completion when typing ... .->. or <C-o>
set tags+=~/.vim/tagstore/tags
map <F12> :!ctags -f ~/.vim/tagstore/tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let mapleader=" "
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

nnoremap <leader>g :GundoToggle<CR>

setlocal spelllang=en_gb
map <F7> :setlocal spell! spell?<CR>
imap <F7> <C-o>:setlocal spell! spell?<CR>

set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

set backspace=2
" Place the backup files in a single directory - kepp it neat!
set backupdir=~/.vim/backup,/tmp
" ?????????
set wrapscan
"set spell
" turn line numbers on
set number
" highlight matching braces
set showmatch
let loaded_matchparen = 1
" Set to auto read when a file is changed from the outside
set autoread
" Highlight doxygen syntax
let g:load_doxygen_syntax=1

" Set the cursor to be centered - when moving vertical..
set so=10

set ruler
set background=dark

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if ( filewritable( b:sessiondir ) != 2 )
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir . '/session.vim'
  exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
  if v:this_session != ""
    echo "Session Saved."
    exe 'mksession! ' . v:this_session
  else
    echo "No Session."
  endif
endfunction

" Loads a session if it exists
function! LoadSession()
  if argc() == 0
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if ( filereadable( b:sessionfile ) )
      exe 'source ' b:sessionfile
    else
      echo "No session loaded."
    endif
  else
    let b:sessionfile = ""
    let b:sessiondir = ""
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call UpdateSession()

" ------------------------------ TaskList ----------------------------------
map <leader>t <Plug>TaskList
let g:tlTokenList = ['TODO', '@todo']

" ------------------------------ Python   ----------------------------------
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


" Ensure the slowdown for buffer matches is prolonged
au Filetype cpp,c,java au BufWinLeave call clearmatches()

augroup vimrc_autocmd
    autocmd!

    " Jump to the last position when reopening a file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " Ensure the syntax is updated on loading.
    autocmd BufEnter * :syntax sync fromstart

    "" Set the colour scheme for lines that exceed text width
    autocmd BufEnter * highlight TooLong ctermbg=18
    autocmd BufEnter * match TooLong '\%81v.'
    autocmd BufEnter * highlight FarTooLong ctermbg=52
    autocmd BufEnter * 2match FarTooLong '\%121v.'
augroup END

" Enable highlighting of GLSL files:
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
au BufNewFile,BufRead wscript setf python
