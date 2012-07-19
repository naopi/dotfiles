filetype off
""" pathogen をコメントアウト
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
" set helpfile=$VIMRUNTIME/doc/help.txt
 
""" Vundle '''
set rtp+=~/.vim/vundle/
call vundle#rc()
filetype plugin on
 
" 利用中のプラグインをBundle
Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'thinca/vim-ref'
Bundle 'kana/vim-fakeclip'
Bundle "mrtazz/simplenote.vim"
Bundle 'motemen/hatena-vim'
Bundle "TwitVim"
Bundle "quickrun.vim"
Bundle "mattn/hahhah-vim"
Bundle "motemen/git-vim"
Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-rails"
Bundle "koron/u-nya-vim"
Bundle "SingleCompile"



"日本語入力設定
set imsearch=0
set iminsert=0
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-2,latin1
set fileformats=unix,dos,mac

"挿入モードでのバックスペースの設定
set backspace=indent,eol

" ========== 表示設定 ==========
:set t_Co=256 " 256 colors
:set background=dark
":color grb256
"カラースキーマを設定
"colorscheme neon
colorscheme torte
"hilight
syntax on
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"ステータスラインを常に表示
set laststatus=2
"ステータスライン表示設定
set statusline=%<%f\ %m%r%h%w%y%{'\ \
\/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}%=%l,%c%V%8P
"ステータスラインにハァハァハァ
"set statusline=%=%{g:HahHah()}
"set statusline=%<%f\ %h%m%r%=%{g:U_nya_()}

" ========== インデント設定 ==========

"新しい行のインデントを現在行と同じにする
set autoindent
"タブの代わりに空白文字を挿入する
set expandtab
"シフト移動幅
set shiftwidth=2
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"新しい行を作ったときに高度な自動インデントを行う
set smartindent

" ========== ファイル保存設定 ==========

"スワップファイル＆バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
set directory=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" ========== yank設定 ==========

"クリップボードをOSと連携
set clipboard=unnamed

" ========== search設定 ==========

"インクリメンタルサーチを行う
set incsearch
"マッチした文字列をハイライト
set hlsearch
"検索時に大文字を含んでいたら大/小を区別
set ignorecase smartcase

" ========== grep設定 ==========

" vimgrep時に自動でQuickFixを開く設定
au QuickfixCmdPost vimgrep cw

" ========== move設定 ==========

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" ========== Align設定 ==========

" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

" ========== その他設定 ==========

"for yankring
set viminfo+=!

" for MRU
let MRU_Max_Entries=50

" ========== マルチバイトを使ううえで ==========

" 記号文字の表示がおかしくならないように
set ambiwidth=double

" ========== include ==========

source $HOME/vimfiles/keymap.vim
source $HOME/vimfiles/functions.vim
source $HOME/vimfiles/addft.vim

" ========== onCreate ==========



let g:SimplenoteUsername = "naopi.chan@gmail.com"
let g:SimplenotePassword = "naopi001"

let twitvim_login = "naopi:naopi001"
let twitvim_count = 100

"===== 2012.07.16 add
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
  colorscheme desert
  " その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
  " 読み込むプラグインの指定
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  " ...
  " 読み込んだプラグインの設定
  " ...
endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    try
      call neobundle#rc(expand('~/.vim/bundle/'))
      call s:LoadBundles()
    catch
      call s:WithoutBundles()
    endtry 
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax on
endfunction

call s:InitNeoBundle()

" solarized カラースキーム
  NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
  NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
  NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
  NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
  NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
  NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
  NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
  NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
  NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
  NeoBundle 'tomasr/molokai'

" カラースキーム一覧表示に Unite.vim を使う
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'ujihisa/unite-colorscheme'
" insert modeで開始
let g:unite_enable_start_insert=1
 
" buffer 一覧
noremap <c-o> :<c-u>Unite buffer -direction=botright <cr>
 
" file 一覧
noremap <c-i> :<c-u>UniteWithBufferDir -buffer-name=files file -direction=botright <cr>
