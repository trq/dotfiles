call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Tlist
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Compact_Format = 1

" Fuzzyfinder
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>

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
set whichwrap=b,s,<,>,[,],~
" set hlsearch
set incsearch
set shortmess=I
set laststatus=2
set foldmethod=marker
set number
set nocompatible
set nottybuiltin term=$TERM
set wildmode=longest:full
set wildmenu
set formatprg=par-format\ -w80
" use 'gqip' to format.
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
highlight StatusLine cterm=none ctermfg=6
"set showtabline=2
"set hidden
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set noswapfile
set nobk

" Disable arrow keys.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

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

" automatically make certain files executable.
au BufWritePost *.sh,*.pl,*.rb,*.py :exe "silent !chmod 700 <afile>" | silent :w!

" automatically set shebangs.
au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/bash") | endif
au BufEnter *.pl if getline(1) == "" | :call setline(1, "#!/usr/bin/env perl") | endif
au BufEnter *.pb if getline(1) == "" | :call setline(1, "#!/usr/bin/env ruby") | endif
au BufEnter *.py if getline(1) == "" | :call setline(1, "#!/usr/bin/env python") | endif

" Turn on spell checking when writting a GIT commit.
autocmd FileType gitcommit set spell

" Common Indentation.
if has("autocmd")
  " Enable file type detection
  filetype on

  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
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

    autocmd BufEnter /www/*/tpl/*.tpl 0r $HOME/.gptech-templates/gptech.tpl
    autocmd BufEnter /www/*/www/*.gpx 0r $HOME/.gptech-templates/gptech.gpx
    autocmd BufEnter /www/*/inc/*.php 0r $HOME/.gptech-templates/gptech.php

endif

au BufRead,BufNewFile Phakefile let is_php=1|setfiletype php
au BufRead,BufNewFile Phakefile setlocal ts=4 sts=4 sw=4 expandtab

nmap <silent> <Leader>k :wincmd k<CR>
nmap <silent> <Leader>j :wincmd j<CR>
nmap <silent> <Leader>h :wincmd h<CR>
nmap <silent> <Leader>l :wincmd l<CR>
nmap <silent> <Leader>[ :wincmd h<CR>
nmap <silent> <Leader>] :wincmd l<CR>
nmap <silent> <Leader>o :only<CR>

" searching (ack)
nmap <Leader>af :AckFile
nmap <Leader>a :Ack

let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
let g:fuf_file_exclude = '_cache|.git'

nnoremap <silent> <Leader> b :FufBuffer<CR>
"nmap <silent> <leader> f     :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent> sK     :FufFileWithFullCwd<CR>
"nnoremap <silent> <Leader> d :FufFile<CR>
"nnoremap <silent> sl     :FufCoverageFileChange<CR>
"nnoremap <silent> sL     :FufCoverageFileChange<CR>
"nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
"nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
"nnoremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> <Leader> d :FufDir<CR>
"nnoremap <silent> sn     :FufMruFile<CR>
"nnoremap <silent> sN     :FufMruFileInCwd<CR>
"nnoremap <silent> sm     :FufMruCmd<CR>
"nnoremap <silent> su     :FufBookmarkFile<CR>
"nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
"vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
"nnoremap <silent> si     :FufBookmarkDir<CR>
"nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
"nnoremap <silent> t     :FufTag<CR>
"nnoremap <silent> sT     :FufTag!<CR>
"nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
"nnoremap <silent> s,     :FufBufferTag<CR>
"nnoremap <silent> s<     :FufBufferTag!<CR>
"vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
"vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
"nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
"nnoremap <silent> s.     :FufBufferTagAll<CR>
"nnoremap <silent> s>     :FufBufferTagAll!<CR>
"vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
"vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
"nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> <Leader> t :FufTaggedFile<CR>
"nnoremap <silent> sG     :FufTaggedFile!<CR>
"nnoremap <silent> <Leader> j :FufJumpList<CR>
"nnoremap <silent> sp     :FufChangeList<CR>
"nnoremap <silent> sq     :FufQuickfix<CR>
"nnoremap <silent> sy     :FufLine<CR>
"nnoremap <silent> sh     :FufHelp<CR>
"nnoremap <silent> se     :FufEditDataFile<CR>
"nnoremap <silent> sr     :FufRenewCache<CR>


" utils
nmap <silent> <Leader>m :!ssh mydev mysql %:r < %<CR>
nmap <silent> <Leader>bl :buffers<CR>
nmap <silent> <Leader>ls :!ls -l<CR>
nmap <silent> <Leader>tr :!tree<CR>
nmap <silent> <Leader>sv :source ~/.vimrc<CR>
nmap <silent> <Leader>ev :tabe ~/.vimrc<CR>
nmap <silent> <Leader>svns :!svn status<CR>
nmap <Leader>p :set paste<CR>
nmap <Leader>ln :set number<CR>
nmap <Leader>nln :set nonumber<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>

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
nnoremap <leader>= :call SplitToggle()<cr>

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
