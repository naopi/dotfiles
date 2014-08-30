" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
  set runtimepath+=~/.vim/bundle/vundle/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

"call vundle#rc()
" color cheme
NeoBundle 'tomasr/molokai.git'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'

NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'szw/vim-tags'
NeoBundle 'vim-scripts/errormarker.vim.git'
NeoBundle 'wincent/Command-T'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'gmarik/vundle'
NeoBundle 'basyura/bitly.vim.git'
NeoBundle 'basyura/TweetVim.git'
NeoBundle 'basyura/twibill.vim.git'
NeoBundle 'h1mesuke/unite-outline.git'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'tyru/open-browser.vim.git'
NeoBundle 'yomi322/neco-tweetvim.git'
NeoBundle 'yomi322/unite-tweetvim.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

" Git関連
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'gregsexton/gitv.git'

" Ruby開発用プラギン
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'scrooloose/nerdcommenter'

" PlayFramerowk用 plugin
NeoBundle 'gre/play2vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'othree/html5.vim'

" Markdown用
NeoBundle 'kannokanno/previm'

" Swift用
NeoBundle 'toyamarinyon/vim-swift'

" Clojure用
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'



filetype plugin indent on     " Required!
"   Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif
" augroup init (from tyru's vimrc)
augroup vimrc
    autocmd!
augroup END

command!
\ -bang -nargs=*
\ MyAutocmd
\ autocmd<bang> vimrc <args>

syntax on

"basic Setting
" display
set showmatch
set number
set ruler
set cursorline
set statusline=2
set laststatus=2
" indent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
" etc
set bs=indent,eol,start
set smartcase
set history=100
set nobackup
set noswapfile
set display=uhex
set autoread

" 編集中の行に下線を引く
MyAutocmd InsertLeave * setlocal nocursorline
MyAutocmd InsertEnter * setlocal cursorline
MyAutocmd InsertLeave * highlight StatusLine ctermfg = 145 guifg = #c2bfa5 guibg = #000000
MyAutocmd InsertEnter * highlight StatusLine ctermfg = 12 guifg = #1E90FF


set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
"set fileformats=unix,dos,mac
if has('guess_encode')
    set fileencodings=guess
else
    set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
      " from ずんWiki http://www.kawaz.jp/pukiwiki/?vim#content_1_7
      " 文字コードの自動認識
      if &encoding !=# 'utf-8'
          set encoding=japan
          set fileencoding=japan
      endif

      if has('iconv')
          let s:enc_euc = 'euc-jp'
          let s:enc_jis = 'iso-2022-jp'
          " iconvがeucJP-msに対応しているかをチェック
          if iconv("\x87\x64\x87\x6a",'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
              let s:enc_euc = 'eucjp-ms'
              let s:enc_jis = 'iso-2022-jp-3'

              " iconvがJISX0213に対応しているかをチェック
          elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
              let s:enc_euc = 'euc-jisx0213'
              let s:enc_jis = 'iso-2022-jp-3'
          endif

          " fileencodingsを構築
          if &encoding  ==# 'utf-8'
              let s:fileencodings_default = &fileencodings
              let &fileencodings = s:enc_jis .','.  s:enc_euc .',cp932'
              let &fileencodings = s:fileencodings_default .','.  &fileencodings
              unlet s:fileencodings_default
          else
              let &fileencodings = &fileencodings .','.  s:enc_jis
              set fileencodings+=utf-8,ucs-2le,ucs-2
              if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
                  set fileencodings+=cp932
                  set fileencodings-=euc-jp
                  set fileencodings-=euc-jisx0213
                  set fileencodings-=eucjp-ms
                  let &encoding = s:enc_euc
                  let &fileencoding = s:enc_euc
              else
                  let &fileencodings = &fileencodings .','.  s:enc_euc
              endif
          endif

          " 定数を処分
          unlet s:enc_euc
          unlet s:enc_jis
      endif
  " }}}
endif

"=====================================================================
" Colorscheme
" -------------------------------------------------------------------
" {{
" colorschehme
if ($ft=='scala')
  colorscheme tomorrow-Night
else
  colorscheme hybrid
  "colorscheme monokai
endif

colorscheme tomorrow-Night
"colorscheme hybrid
"let g:hybrid_use_iTerm_colors = 1
  
"colorscheme jellybeans
"colorscheme molokai

"let g:molokai_original=1
"let g:rehash256 = 1
set background=dark
"}}

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'scala' : $HOME . '/.vim/dict/scala.dict',
    \ }

" filetype autocmd
autocmd BufNewFile,BufRead *.java set filetype=java
autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd BufNewFile,BufRead *.sbt set filetype=scala
autocmd BufNewFile,BufRead *.gradle set filetype=groovy

" neosnippet
"   Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

"   SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"   For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/snippets'

" vimsehll
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USER."% "
"vimshell map
nmap vs :VimShell<CR>
nmap vp :VimShellPop<CR>

" make
autocmd FileType scala :compiler sbt
autocmd QuickFixCmdPost make if len(getqflist()) != 0 | copen | endif

" marker
let g:errormarker_errortext     = '!!'
let g:errormarker_warningtext   = '??'
let g:errormarker_errorgroup    = 'Error'
let g:errormarker_warninggroup  = 'ToDo'

" TagBar
nmap <F8> :TagbarToggle<CR>

" NERDTree
nmap <silent> <C-e> :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
omap <silent> <C-e> :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeShowHidden=1

" vim-tags
nnoremap <C-]> g<C-]>

" indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 1

" .vimrcの編集起動
nnoremap <Space>.  :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>>  :<C-u>source $MYVIMRC<Enter>
nnoremap <Space>,  :<C-u>edit $MYGVIMRC<Enter>

" 矢印キーを封印する
"noremap <Up>    <Nop>
"noremap <Down>  <Nop>
"noremap <Left>  <Nop>
"noremap <Right> <Nop>

" lightlineの設定
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \       ['mode', 'paste'],
      \       ['readonly', 'filename', 'modified', 'anzu']
      \   ]
      \ },
      \ 'component_function': {
      \   'anzu': 'anzu#search_status'
      \ }
      \ }

" tabline
set showtabline=2
command! -nargs=+ -complete=file Te tabedit <args>
command! -nargs=* -complete=file Tn tabnew <args>
nnoremap <silent> <S-Right> :<C-U>tabnext<CR>
nnoremap <silent> <S-Left> :<C-U>tabprevious<CR>
nnoremap <silent> <C-l> :<C-U>tabnext<CR>
nnoremap <silent> <C-h> :<C-U>tabprevious<CR>
nnoremap [tab]+     :<C-U>tabmove +1<CR>
nnoremap [tab]-     :<C-U>tabmove -1<CR>


" using vim for Java Programming
set makeprg=./gradlew
set errorformat=
    \%-G[%\\(WARNING]%\\)%\\@!%.%#,
    \%A%[%^[]%\\@=%f:[%l\\,%v]\ %m,
    \%W[WARNING]\ %f:[%l\\,%v]\ %m,
    \%-Z\ %#,
    \%-Clocation\ %#:%.%#,
    \%C%[%^:]%#%m,
    \%-G%.%#

" TweetVim
let g:tweetvim_tweet_per_page = 50

" F6と,uvでTweetVimのtimeline選択
nnoremap <F6> :<C-u>Unite tweetvim<CR>
nnoremap ,uv :<C-u>Unite tweetvim<CR>

" Etc
nnoremap ,tl :<C-u>TweetVimHomeTimeline<CR>
nnoremap ,tm :<C-u>TweetVimMentions<CR>
nnoremap ,ts :<C-u>TweetVimSay<CR>
nnoremap ,tc :<C-u>TweetVimCommandSay

" QuickRun
let g:quickrun_config = {
\ "cpp/g++": {
\   "cmdopt":"-std=c++0x",
\   "hook/time/enable" : 1
\   },
\ "_":{
\   "outputter/buffer/split" : ":botright",
\   "outputter/buffer/close_on_empty" : 1
\   },
\}
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" Markdown形式のファイルを開く設定
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
  

" Clojure用 
" rainbow_parentheses.vimの括弧の色付けを有効化
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare

