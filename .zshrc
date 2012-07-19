alias ls='ls -G'
export LANG=ja_JP.UTF-8
export PATH=~/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:~/play:$PATH
#export PATH=~/bin:/usr/local/bin:$PATH

# / プロンプト prompt
# ---------------------------------------------------------

# 太字-01  下線-04  点滅-05  配色反転-07  非表示-08
# ノーマル化-22 下線なし-24 点滅なし-25 配色反転なし-27
# 文字色 黒-30 赤-31 緑-32 黄-33 青-34 紫-35 水-36 白-37
# 背景色 黒-40 赤-41 緑-42 黄-43 青-44 紫-45 水-46 白-47
# ref : http://gihyo.jp/dev/serial/01/zsh-book/0003
local DEFAULT=$'%{\e[m%}'
local RED=$'%{\e[31m%}'
local PURPLE=$'%{\e[35m%}'

if [ "$EMACS" ];then

  # emacsで起動した時の処理
  PROMPT="[%n@%m:%//] %# "
  PROMPT2="%_%b "
  SPROMPT="%r is correct? [n,y,a,e]: "

else

  #Terminalから起動した時の処理
  case ${UID} in
  0)
      # root時
      PROMPT="$RED"[%n@%m:"$PURPLE"%//"$RED"]" $DEFAULT%# "
      PROMPT2="%_%b "
      SPROMPT="%r is correct? [n,y,a,e]: "
      ;;
  *)
      # 一般ユーザ
      PROMPT="$RED"[%n@%m:"$PURPLE"%~/"$RED"]" $DEFAULT%# "
      PROMPT2="%_%% "
      SPROMPT="%r is correct? [n,y,a,e]: "
      ;;
  esac

fi

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
 
