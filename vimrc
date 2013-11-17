set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-fugitive'
Bundle 'bogado/file-line'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/L9'
Bundle 'groenewege/vim-less'
Bundle 'rodjek/vim-puppet'
Bundle 'vim-scripts/bufexplorer'
Bundle 'tpope/vim-unimpaired'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'
Bundle 'troydm/pb.vim'
Bundle 'tpope/vim-abolish'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-obsession'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-commentary'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mhinz/vim-signify'
Bundle 'beberlei/vim-php-refactor'
Bundle 'mattn/emmet-vim'
Bundle 'gregsexton/gitv'
Bundle 'justinmk/vim-sneak'
Bundle 'tpope/vim-markdown'
Bundle 'benmills/vimux'
Bundle 'scrooloose/nerdtree'
Bundle 'brookhong/DBGPavim'

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
set encoding=utf-8 nobomb " BOM often causes trouble
set history=1000
set background=dark
set showmatch
set nohlsearch
set nowrap
set fillchars=
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
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 'php', 'phpcs', 'phpmd'
let g:syntastic_php_checkers=['php']

highlight ColorColumn ctermbg=grey
highlight StatusLine cterm=none ctermfg=darkgrey
highlight LineNr ctermfg=darkgrey
highlight CursorLine ctermbg=darkgrey
highlight CursorColumn ctermbg=darkgrey ctermfg=grey
highlight Vertsplit ctermbg=darkgrey ctermfg=darkgrey
highlight Visual ctermbg=52
highlight Pmenu ctermbg=darkgrey ctermfg=darkgrey
highlight PmenuSel ctermbg=darkgrey ctermfg=white

" Highlight whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Tlist
nnoremap <silent> <leader>= :TlistToggle<cr>
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
highlight MyTagListTagName ctermfg=darkgrey
highlight MyTagListFileName ctermfg=darkgrey

"ctrlp
"let g:ctrlp_root_markers = ['_inc/', 'inc/']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" Wildmenu
if has("wildmenu")
    set wildignore+=*.a,*.o,*.tbz,*.selfbk
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif

" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" Disable arrow keys entirely.
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap <silent> <leader>my :!mysql -t %:r:r < %<cr>
vnoremap <silent> <leader>my :My<cr>
nnoremap <silent> <leader>v :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>; :BufExplorer<cr>
nnoremap <silent> <leader>g :GundoToggle<cr>
inoremap jk <esc>

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
"autocmd BufReadPost fugitive://* set bufhidden=delete

augroup chmodandshebang
    autocmd!
    autocmd BufWritePost *.sh,*.pl,*.rb,*.py :exe "silent !chmod 700 <afile>" | silent :w!
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

" Work
"if hostname() == 'xtal.local' || hostname() == 'tonysentral.syd.gptech.local'
    set path=.,/www/**
    " handle gpx files as php.
    au BufRead,BufNewFile *.gpx let is_php=1|setfiletype php
    au BufRead,BufNewFile *.gpx setlocal ts=4 sts=4 sw=4 expandtab
    au BufRead,BufNewFile *.inc let is_php=1|setfiletype php
    au BufRead,BufNewFile *.inc setlocal ts=4 sts=4 sw=4 expandtab
    au BufRead,BufNewFile *.tpl let is_smarty=1|setfiletype smarty
    au BufRead,BufNewFile *.tpl setlocal ts=2 sts=2 sw=2 expandtab
    au BufRead,BufNewFile *.blade.php let is_html=1|setfiletype html
    au BufRead,BufNewFile *.blade.php setlocal ts=2 sts=2 sw=2 expandtab

    autocmd BufNewFile */tpl/*.tpl 0r $HOME/.gptech-templates/gptech.tpl
    autocmd BufNewFile */www/*.gpx 0r $HOME/.gptech-templates/gptech.gpx
    autocmd BufNewFile */inc/*.php 0r $HOME/.gptech-templates/gptech.php
"endif

au BufRead,BufNewFile Vagrantfile let is_ruby=1|setfiletype ruby
au BufRead,BufNewFile Phakefile let is_php=1|setfiletype php
au BufRead,BufNewFile *.twig let is_html=1 | setfiletype html

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

let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0

" Set the minimal split width
"set winwidth=24
"set winminwidth=24
"function! SplitToggle()
"  if(&winwidth == &winminwidth)
"    set winwidth=999
"  else
"    set winwidth=24
"    wincmd =
"  endif
"endfunc
"nnoremap <leader>- :call SplitToggle()<cr>

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
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
