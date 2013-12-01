set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'beberlei/vim-php-refactor'
Bundle 'benmills/vimux'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'docteurklein/vim-symfony'
Bundle 'edkolev/tmuxline.vim'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/gitv'
Bundle 'groenewege/vim-less'
Bundle 'joonty/vdebug.git'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-signify'
Bundle 'msanders/snipmate.vim'
Bundle 'rking/ag.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/clam.vim'
Bundle 'sjl/gundo.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'troydm/pb.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/L9'

set cindent
set smartindent
set autoindent
set expandtab
set lazyredraw
set tabstop=2
set shiftwidth=2
set cinkeys=0{,0},:,0#,!^F
"set showcmd
set relativenumber
set numberwidth=3
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set encoding=utf-8 nobomb " BOM often causes trouble
set history=1000
set showmatch
set nohlsearch
set nowrap
set whichwrap=b,s,<,>,[,],~
set hlsearch
set incsearch
set shortmess=I
set laststatus=2
set foldmethod=marker
set number
set nocompatible
set nottybuiltin term=$TERM
set formatprg=par-format\ -w80
set wmh=0
set term=xterm-256color
"set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set hidden
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set noswapfile
set nobk
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
set scrolloff=40
set sidescrolloff=40
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set ttimeoutlen=20
set noshowmode
set fillchars+=stl:\ ,stlnc:\
set encoding=utf-8
set tags+=./tags,./vendor.tags

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" shortcut to jump to next conflict marker
nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" mouse :(
set ttyfast
set mouse=a
set ttymouse=xterm2

" appearance
syntax on
syntax enable
set background=dark
set t_Co=256 " 256 colors in terminal
set cursorline
colorscheme molokai_custom

" powerline
let g:airline_powerline_fonts                 = 1
let g:airline_theme                           = 'powerlineish'
let g:airline_enable_branch                   = 1
let g:bufferline_echo                         = 0
let g:airline_enable_syntastic                = 1
let g:airline_left_sep                        = '⮀'
let g:airline_left_alt_sep                    = '⮁'
let g:airline_right_sep                       = '⮂'
let g:airline_right_alt_sep                   = '⮃'
let g:airline_symbols                         = {}
let g:airline_symbols.branch                  = '⭠'
let g:airline_symbols.readonly                = '⭤'
let g:airline_symbols.linenr                  = '⭡'
let g:airline#extensions#bufferline#enabled   = 0
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#tmuxline#enabled     = 0

" Yggdroot/indentLine
"set list lcs=tab:\|\
"let g:indentLine_color_term=234
"let g:indentLine_char = '┆'

" Sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

"Buffer line
let g:bufferline_echo = 0

" Nerdtree
nnoremap <leader>- :NERDTreeToggle<CR>

" Tagbar
nnoremap <silent> <leader>= :TagbarToggle<cr>
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_indent = 1

" Highlight whitespace.
highlight ExtraWhitespace ctermbg=96
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" 'php', 'phpcs', 'phpmd'
let g:syntastic_php_checkers=['php']

"ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore app/cache --ignore vendor -g ""'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
nnoremap <silent> <leader>b :CtrlPBuffer<cr>

" Vdebug
let g:vdebug_keymap = {
\    "run" : "<Leader>/",
\    "run_to_cursor" : "<Down>",
\    "step_over" : "<Up>",
\    "step_into" : "<Left>",
\    "step_out" : "<Right>",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>p",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e"
\}

let g:vdebug_options = {
\    "port" : 9000,
\    "timeout" : 20,
\    "server" : 'localhost',
\    "on_close" : 'detach',
\    "break_on_open" : 1,
\    "ide_key" : '',
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "path_maps" : {},
\    "watch_window_style" : 'expanded',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾',
\    "continuous_mode"  : 1
\}

" Wildmenu
if has("wildmenu")
    set wildignore+=*.a,*.o,*.tbz,*.selfbk
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildignore+=*/app/cache/*
    set wildmenu
    set wildmode=longest,list
endif

" Disable arrow keys entirely.
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Custom mappings
nnoremap <silent> <leader>my :!mysql -t %:r:r < %<cr>
vnoremap <silent> <leader>my :My<cr>
nnoremap <silent> <leader>v :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>; :BufExplorer<cr>
nnoremap <silent> <leader>g :GundoToggle<cr>
nnoremap <silent> <leader>1 :Tabularize /=<cr>
nnoremap <silent> <leader>2 :Tabularize /=><cr>
vnoremap <silent> <leader>1 :Tabularize /=<cr>
vnoremap <silent> <leader>2 :Tabularize /=><cr>
inoremap jk <esc>

" https://github.com/arnaud-lb/vim-php-namespace
inoremap <Leader>u <c-o>:call PhpInsertUse()<cr>
noremap <Leader>u :call PhpInsertUse()<cr>
inoremap <Leader>q <c-o>:call PhpExpandClass()<cr>
noremap <Leader>q :call PhpExpandClass()<cr>

" sudo write
noremap <leader>W :w !sudo tee %<CR>

" see http://vimcasts.org/episodes/the-edit-command
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" lookup a php function interface
function! PHPMan(func)
    execute ':!php --rf ' . a:func
endfunction
command! -nargs=1 Pm :call PHPMan("<args>")

" Attempt at a symfony console
function! SymfonyConsole(func)
    execute ':!./app/console ' . a:func
endfunction
command! -nargs=1 Symfony :call SymfonyConsole("<args>")

function! MySQL() range
    echo system("mysql -t " . expand('%:r:r') . " -e " . shellescape(join(getline(a:firstline, a:lastline), "\n")))
endfunction
command! -range=% -nargs=0 My :<line1>,<line2>call MySQL()

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" save a hostname variable.
" let hostname = substitute(system('hostname'), '\n', '', '')

filetype plugin on
syntax on

setlocal spelllang=en_au

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Remove fugitive buffers as they are closed.
autocmd BufReadPost fugitive://* set bufhidden=delete

" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

augroup chmodandshebang
    autocmd!
    autocmd BufWritePost ~/bin/*,*.sh,*.pl,*.rb,*.py :exe "silent !chmod 700 <afile>" | silent :w!
    autocmd BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/usr/bin/env bash") | endif
    autocmd BufEnter *.pl if getline(1) == "" | :call setline(1, "#!/usr/bin/env perl") | endif
    autocmd BufEnter *.pb if getline(1) == "" | :call setline(1, "#!/usr/bin/env ruby") | endif
    autocmd BufEnter *.py if getline(1) == "" | :call setline(1, "#!/usr/bin/env python") | endif
augroup END

" Turn on spell checking when writting a GIT commit.
autocmd FileType gitcommit set spell

" Common Indentation.
if has("autocmd")
  " Enable file type detection
  filetype on

  " auto source .vimrc on write
  "au BufWritePost .vimrc source $MYVIMRC

  au BufRead,BufNewFile *.json setfiletype=json syntax=javascript
  au BufRead,BufNewFile *.less setfiletype=css syntax=css

  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType ruby setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType bash setlocal ts=4 sts=4 sw=4 expandtab

  au BufRead,BufNewFile *.opm setfiletype sh
  au BufRead,BufNewFile *.opm setlocal ts=4 sts=4 sw=4 expandtab
endif

" Conditional based on location.
"
" My computers / servers.
if hostname() == 'dev'
    " proem
    autocmd BufEnter $HOME/src/proem/lib/Proem/*.php 0r $HOME/.vim-templates/proem.class.php
    autocmd BufEnter $HOME/src/proem/tests/Proem/*.php 0r $HOME/.vim-templates/proem.test.php

endif

au BufRead,BufNewFile Vagrantfile let is_ruby=1|setfiletype ruby
au BufRead,BufNewFile Phakefile let is_php=1|setfiletype php
au BufRead,BufNewFile *.twig set filetype=htmljinja

" Set the minimal split width
set winwidth=24
set winminwidth=24
function! SplitToggle()
  if(&winwidth == &winminwidth)
    set winwidth=999
  else
    set winwidth=24
    wincmd =
  endif
endfunc
"nnoremap <leader>- :call SplitToggle()<cr>

" Toggle the quickfix window
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" templates.
" autocmd BufEnter $HOME/bin/*.php 0r $HOME/.vim/templates/a.txt
" autocmd BufNewFile *.sh 0r $HOME/.vim/templates/b.txt

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP Stuff.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:autocmd Filetype php call Filetype_Php()

function! Filetype_Php()

    " PHP parser check (CTRL-L)
    nmap <Leader>pl :!/usr/bin/php -l %<CR>

    set keywordprg=pman

    "If you like SQL syntax hightlighting inside Strings: >
    let php_sql_query = 1

    ""Enable HTML syntax highlighting inside strings: >
    let php_htmlInStrings = 1

    "For highlighting parent error ] or ): >
    let php_parent_error_close = 1

    setlocal ts=4 sts=4 sw=4 expandtab

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"end PHP Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""s


" Strip trailing white space.
function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" call the above function automatically when saving files of certain type.
autocmd BufWritePre *.py,*.js,*.php,*.gpx,*.rb,*.tpl :call StripTrailingWhitespaces()

" php code sniffer via :Rhpcs
function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=csv --standard=Zend '.l:filename)
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction
set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
command! Rhpcs execute RunPhpcs()

" Use <Leader>ee to execute a command under the cursor within a file.
function! EC()
    let l:Command = getline(".")
    execute "!" . l:Command
endfunction
command! Ec execute EC()
nmap <Leader>x :Ec<CR>

function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction
"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
" command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
