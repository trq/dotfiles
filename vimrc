call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm

"colorscheme morning
"set autochdir
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set cinkeys=0{,0},:,0#,!^F
set showcmd
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set background=dark
set showmatch
set nohlsearch
set nowrap
set fillchars=
set whichwrap=b,s,<,>,[,],~
" set hlsearch
set incsearch
set shortmess=I
set laststatus=2
set foldmethod=marker
set number
set nocompatible
set nottybuiltin term=$TERM
set wildmenu
set wildmode=longest,list
set formatprg=par-format\ -w80
set wmh=0
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set hidden
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set noswapfile
set nobk
"set textwidth=120
"set colorcolumn=120
highlight ColorColumn ctermbg=darkgrey
highlight StatusLine cterm=none ctermfg=black
highlight LineNr ctermfg=darkgrey
highlight CursorLine ctermbg=darkgrey
highlight CursorColumn ctermbg=darkgrey ctermfg=darkgrey
highlight Vertsplit ctermbg=darkgrey ctermfg=darkgrey
highlight Visual ctermbg=52

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Tlist
nnoremap <silent> <leader>= :TlistToggle<cr>
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0
"let Tlist_Auto_Highlight_Tag = 0
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
highlight MyTagListTagName ctermfg=darkgrey
highlight MyTagListFileName ctermfg=darkgrey

" xhair stuff.
set cursorline
set cursorcolumn
augroup xhairs
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
    autocmd InsertEnter * set nocursorcolumn
    autocmd InsertLeave * set cursorcolumn
augroup end

" Wildmenu
if has("wildmenu")
    set wildignore+=*.a,*.o,*.tbz,*.selfbk
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif

function! MySQL() range
    echo system("mysql -t " . expand('%:r:r') . " -e " . shellescape(join(getline(a:firstline, a:lastline), "\n")))
endfunction
command! -range=% -nargs=0 My :<line1>,<line2>call MySQL()

inoremap ~~ <C-X><C-F>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <silent> <leader>l :NERDTreeToggle<CR>
nnoremap <silent> <leader>9 :wincmd h<CR>
nnoremap <silent> <leader>0 :wincmd l<CR>
nnoremap <silent> <leader>[ :bp<CR>
nnoremap <silent> <leader>] :bn<CR>
nnoremap <silent> <leader>o :only<CR>
nnoremap <silent> <leader>m :!mysql -t %:r:r < %<CR>
vnoremap <silent> <leader>m :My<cr>
nnoremap <silent> <leader>bl :buffers<CR>
nnoremap <silent> <leader>ls :!ls -l<CR>
nnoremap <silent> <leader>tr :!tree<CR>
nnoremap <silent> <leader>sv :source ~/.vimrc<CR>
nnoremap <silent> <leader>ev :tabe ~/.vimrc<CR>
nnoremap <silent> <leader>svns :!svn status<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>n :set number!<CR>
nnoremap <leader>s :set spell!<CR>
inoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap ;; :w<cr>
nnoremap <silent> <leader>; :BufExplorer<cr>
nnoremap <silent> <leader>vp :!./vendor/bin/phake<CR>

" lookup a php function interface
function! PHPMan(func)
    execute ':!php --rf ' . a:func
endfunction
command! -nargs=1 Pm :call PHPMan("<args>")

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

augroup chmodandshebang
    autocmd!
    autocmd BufWritePost *.sh,*.pl,*.rb,*.py :exe "silent !chmod 700 <afile>" | silent :w!
    autocmd BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/bash") | endif
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

  au BufRead,BufNewFile *.json let is_javascript = 1| setfiletype javascript

  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType ruby setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType bash setlocal ts=4 sts=4 sw=4 expandtab
endif

" Conditional based on location.
"
" My computers / servers.
if hostname() == 'dev'
    " proem
    autocmd BufEnter $HOME/src/proem/lib/Proem/*.php 0r $HOME/.vim-templates/proem.class.php
    autocmd BufEnter $HOME/src/proem/tests/Proem/*.php 0r $HOME/.vim-templates/proem.test.php

endif

" Work
if hostname() == 'xtal.local' || hostname() == 'tonysentral.syd.gptech.local'
    " handle gpx files as php.
    au BufRead,BufNewFile *.gpx let is_php=1|setfiletype php
    au BufRead,BufNewFile *.gpx setlocal ts=4 sts=4 sw=4 expandtab
    au BufRead,BufNewFile *.inc let is_php=1|setfiletype php
    au BufRead,BufNewFile *.inc setlocal ts=4 sts=4 sw=4 expandtab
    au BufRead,BufNewFile *.tpl let is_smarty=1|setfiletype smarty
    au BufRead,BufNewFile *.tpl setlocal ts=2 sts=2 sw=2 expandtab

    autocmd BufNewFile */tpl/*.tpl 0r $HOME/.gptech-templates/gptech.tpl
    autocmd BufNewFile */www/*.gpx 0r $HOME/.gptech-templates/gptech.gpx
    autocmd BufNewFile */inc/*.php 0r $HOME/.gptech-templates/gptech.php


endif

au BufRead,BufNewFile Phakefile let is_php=1|setfiletype php
au BufRead,BufNewFile Phakefile setlocal ts=4 sts=4 sw=4 expandtab
au BufRead,BufNewFile *.twig let is_html=1 | setfiletype html
au BufRead,BufNewFile *.twig setlocal ts=2 sts=2 sw=2 expandtab

" Toggle between .gpx and there corresponding .tpl files
function! ToggleGpxTpl ()
    let l:ext = expand('%:e')
    let l:filepath = substitute(expand('%:p'), '\/usr\/sentral\/www', '', '')
    echo filepath
    if l:ext == 'gpx'
        let l:filepath = substitute(expand(l:filepath), 'www', 'tpl', '')
        let l:filepath = substitute(expand(l:filepath), '.gpx', '.tpl', '')
    else
        let l:filepath = substitute(expand(l:filepath), 'tpl', 'www', '')
        let l:filepath = substitute(expand(l:filepath), '.tpl', '.gpx', '')
    endif
    execute ":edit /usr/sentral/www" . l:filepath
endfunction
nnoremap <silent> <leader>' :call ToggleGpxTpl()<CR>

" Highlight whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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
nnoremap <leader>- :call SplitToggle()<cr>

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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Strip trailing white space.
function! <SID>StripTrailingWhitespaces()
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
autocmd BufWritePre *.py,*.js,*.php,*.gpx,*.rb :call <SID>StripTrailingWhitespaces()

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
