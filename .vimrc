"Suppress persistent highlighting of searched terms"
set nohlsearch
set autowriteall

set nocompatible
filetype plugin indent on
syntax on

set backspace=indent,eol,start
set ruler

let mapleader = ","

set tabstop=2 shiftwidth=2 expandtab

"F6 to user awsfind on the word under the cursor
nnoremap <silent> <F6> :!awsfind <cword><CR>

"incrementally search file"
set incsearch

"put filename in title bar"
set title

"allow backspacing over everything in INSERT mode
set bs=2

"search for files like bash"
set wildmode=list:longest

" autosave if I switch to another buffer
set autowrite

"move swp files into .vim-tmp/"
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" edit and update vimrc from ANYWHERE
map <leader>rc :e ~/.vim/.vimrc<CR><C-W>
map <leader>rs :so %

" take me to the command line.
map <leader>c :!<CR>

" stop the process
map <leader>z z

" grep recursively, ignoring case
map <leader>g :! grep -ir 

"svn commands
map <leader>up :! svn up<CR>
map <leader>ci :! export VISUAL=vi && svn ci<CR>
map <leader>st :! svn st<CR>

" FuzzyFinder and switchback commands
map <leader>e :e#<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>f :FuzzyFinderFile<CR>

map <leader>s :%s/

map <leader>t :! rake test<CR>
map <leader>ta :! rake testall<CR>
map <leader>tf :! rake test:functionals<CR>
map <leader>tu :! rake test:units<CR>

map <leader>ub :! rake uadmin_boot<CR>

" Split screen vertically and move between screens.
map <leader>v :vsp<CR> 
map <leader>h h
map <leader>< h
map <leader>l l
map <leader>> l
map <leader>= =

" Move between horizontally split screens.
map <leader>j j
map <leader>k k

" set shortcut for TlistToggle
map <leader>tt :TlistToggle<CR>

" set question mark to be part of a VIM word. in Ruby it is!
set isk=@,48-57,_,?,!,192-255
map <leader>n :tnext
map <leader>back t

" tags shortcuts
map fd 
map ps 
map ut :Runittest<CR>
map ft :Rfunctionaltest<CR>
map md :Rmodel<CR>
map cd :Rcontroller<CR>
map uts :vsp<CR>l:Runittest<CR>
map fts :vsp<CR>l:Rfuntionaltest<CR>

map <leader>sa :! rake spec:acceptance<CR>
if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

" Run Ruby unit tests with gT (for all) or gt (only test under
" cursor) in command mode
augroup RubyTests
  au!
  autocmd BufRead,BufNewFile *_test.rb,test_*.rb
    \ :nmap gt V:<C-U>!$HOME/.vim/bin/ruby-run-focused-unit-test 
    \ % <C-R>=line("'<")<CR>p <CR>|
    \ :nmap gT :<C-U>!ruby %<CR>
augroup END

let Tlist_Ctags_Cmd='/usr/bin/ctags'
