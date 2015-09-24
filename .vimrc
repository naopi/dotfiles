" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

" Color Scheme
NeoBundle 'tomasr/molokai.git'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'

NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

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

" unite {{{
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/unite-gem'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'rhysd/unite-ruby-require.vim'
NeoBundle 'joker1007/unite-pull-request'
NeoBundle 'osyo-manga/unite-quickrun_config'
NeoBundle 'Shougo/neomru.vim'

NeoBundleLazy 'Shougo/unite.vim', {
\   'autoload' : {
\       'commands' : [ "Unite", "UniteWithBufferDir", "UniteWithCurrentDir" ]
\   }
\}
" }}}

" Git関連 {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'airblade/vim-gitgutter'

NeoBundleLazy 'mattn/gist-vim', {
      \   'autoload' : {
      \       'commands' : [ "Gist" ]
      \   }
      \}
" }}}

" Clojure用 http://blog.ieknir.com/blog/beginning-clojure-with-vim/
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'

" JavaScript
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/syntastic'


" TypeScript用
NeoBundle 'clausreinke/typescript-tools.git'
NeoBundle 'leafgarland/typescript-vim.git'

" Memolist
NeoBundle 'fuenor/qfixgrep.git'
NeoBundle 'glidenote/memolist.vim'

" Haskell {{{
NeoBundle 'dag/vim2hs'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundleLazy 'eagletmt/ghcmod-vim', {
      \   'autoload' : {
      \       'filetypes' : [ "haskell" ]
      \   }
      \}

NeoBundleLazy 'ujihisa/neco-ghc', {
      \   'autoload' : {
      \       'filetypes' : [ "haskell" ]
      \   }
      \}
" }}}

" Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" html template {{{
NeoBundle 'mattn/emmet-vim'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'juvenn/mustache.vim'
" }}}

NeoBundle 'jpalardy/vim-slime'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" augroup init (from tyru's vimrc)
augroup vimrc
  autocmd!
augroup END

command!
  \ -bang -nargs=*
  \ MyAutocmd
  \ autocmd<bang> vimrc <args>

"basic Setting
" display
set showmatch
set number
set ruler
set cursorline
set statusline=2
set laststatus=2
set list
set listchars=eol:¬,tab:▸\

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
set updatetime=50



"=====================================================================
" Colorscheme
" -------------------------------------------------------------------
" {{
" colorschehme
if ($ft=='scala')
  colorscheme Tomorrow-Night
else
  colorscheme hybrid
  "colorscheme monokai
endif

"colorscheme Tomorrow-Night
colorscheme molokai
"colorscheme hybrid
"let g:hybrid_use_iTerm_colors = 1
  
"colorscheme jellybeans
"colorscheme molokai

"let g:molokai_original=1
"let g:rehash256 = 1
set background=dark
"}}

" ポップアップメニューのカラーを設定
MyAutocmd Syntax * hi Pmenu ctermfg=15 ctermbg=18 guibg=#666666
MyAutocmd Syntax * hi PmenuSel ctermbg=39 ctermfg=0 guibg=#8cd0d3 guifg=#666666
MyAutocmd Syntax * hi PmenuSbar guibg=#333333


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

" バッファ切り替え {{{
nnoremap [space]n :<C-U>bnext<CR>
nnoremap [space]p :<C-U>bprevious<CR>
nnoremap <Leader>1   :e #1<CR>
nnoremap <Leader>2   :e #2<CR>
nnoremap <Leader>3   :e #3<CR>
nnoremap <Leader>4   :e #4<CR>
nnoremap <Leader>5   :e #5<CR>
nnoremap <Leader>6   :e #6<CR>
nnoremap <Leader>7   :e #7<CR>
nnoremap <Leader>8   :e #8<CR>
nnoremap <Leader>9   :e #9<CR>
" バッファ一覧
nmap ,b :buffers<CR>
" }}}

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
" set makeprg=./gradlew
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
nnoremap <silent> \r :QuickRun -cmdopt "<CR>

" 水平に分割する
let g:quickrun_config={'*': {'split': ''}}


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

" TypeScript用
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let s:system=exists('g:loaded_vimproc')?'vimproc#system_bg':'system'
augroup vim-auto-typescript
  autocmd!
  "適当なタイミングで再読み込み
  autocmd CursorHold *.ts:checktime
  autocmd CursorMoved *.ts:checktime

  " 書き込み時にjsに出力する
  autocmd BufWritePost *.ts:call {system}("tsc main.js")
augroup END


"Memolist
let g:memolist_qfixgrep = 1
map <Leader>ml  :MemoList<CR>
map <Leader>mn  :MemoNew<CR>
map <Leader>mg  :MemoGrep<CR>


" TweetVim {{{
nnoremap <silent> S :<C-u>TweetVimSay<CR>
nnoremap <silent> [unite]t   :<C-u>Unite tweetvim<CR>
nnoremap <silent> [space]ts   :<C-u>TweetVimUserStream<CR>
nnoremap <silent> [space]tt   :<C-u>TweetVimHomeTimeline<CR>
if neobundle#tap('TweetVim')
  let g:tweetvim_include_rts = 1
  if has('mac')
    let g:tweetvim_display_icon = 0
  else
    let g:tweetvim_display_icon = 1
  end

  call neobundle#untap()
endif
" }}}

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nnoremap gx <Plug>(openbrowser-smart-search)
vnoremap gx <Plug>(openbrowser-smart-search)
function! OpenBrowserLine()
  let matched = matchlist(getline("."), 'https\?://[0-9A-Za-z_#?~=\-+%\.\/:]\+')
  if len(matched) == 0
    break
  endif
  execute "OpenBrowser " . matched[0]
endfunction

" Haskell 
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" JavaScript
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_check_on_wq = 0 " wqではチェックしない
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
set statusline+=%#warningmsg# "エラーメッセージの書式
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint'] "ESLintを使う
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': []
      \ }
