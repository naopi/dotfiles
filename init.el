;; ターミナル以外でEmacsを立ち上げてもpathが通るようにする
(defun set-exec-path-from-shell-PATH ()
    "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
    (interactive)
    (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
      (setenv "PATH" path-from-shell)
      (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get https://github.com/dimitri/el-get
;;(add-to-list 'load-path (locate-user-emacs-file "el-get"))
;;(require 'el-get)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; el-getでダウンロードしたパッケージは ~/.emacs.d/ に入るようにする
(setq el-get-dir (locate-user-emacs-file "elisp"))

;;; ユーザー情報
(setq user-full-name "Naoya ISHII")
(setq user-mail-address "naopi.chan@gmail.com")

;; Color theme
;;(el-get-bundle aurora-theme)
(load-theme 'wombat t)
;;(color-theme-molokai) ;; 使うカラーテーマ名

;; Line Number
(global-linum-mode t)

;; emacsデフォルトの設定
;;;;;;;;;;;;;;;;;;;;;;;;;
;; カーソルのある行がハイライトされる
;; (global-hl-line-mode t)
;; (custom-set-faces '(hl-line ((t (:background "dark gray")))))
;; (setq hl-line-face 'underline) ; 下線（ただしアンダーバーが見えない）

;; ビープ音を消す
(setq ring-bell-function 'ignore)

;; メニュー消す
(tool-bar-mode 0)

;; デフォルトのインデント幅は2, タブは使わず半角スペースにする
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

;; 矩形選択のキーバインドを C-x SPC に設定
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; cua-mode の不要なキーバインドは除去
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; サスペンドをC-tにし、UndoをC-zにする
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-t") 'suspend-frame)

;; el-getを使ったemacsのパッケージ設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-conplete
;;(el-get-bundle auto-complete)
(el-get-bundle elpa:auto-complete)

;; auto-complete が発動するキー
;; (ac-set-trigger-key "TAB")

;; 補完が出るまでの時間
;; (setq ac-quick-help-delay 0.5)

;; yasnippet
;; see http://konbu13.hatenablog.com/entry/2014/01/12/113300
(el-get-bundle yasnippet)
(yas-global-mode 1)

;; smart-cursor-color
;; カーソルとかハイライトで文字が見づらくなる現象を解消してくれる
;;(el-get-bundle smart-cursor-color    )
;;(smart-cursor-color-mode +1)

;; powerline 見た目を変えるだけ
(el-get-bundle emacs-powerline)
(setq powerline-arrow-shape 'curve) ; これで角が変わるけどターミナルだと効かない
(setq powerline-color1 "grey22")
(setq powerline-color2 "grey40")

;; magit
;; 使い方参考:
;; http://gom.hatenablog.com/entry/20090524/1243170341
;; http://blog.kzfmix.com/entry/1334196627
;; emacs 24.4 以上が必要なようなのでとりあえず保留
(el-get-bundle magit)

;; flycheck エラーチェックを行う
;; see http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b
;; texinfo がインストールされていないと makeinfo が動かない
;; apt-get install texinfo
;; brew instal texinfo
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; tree-undo
(el-get-bundle undo-tree)
(global-undo-tree-mode t) ; デフォルトをundo-treeのundoにする

;; C-M-z でredoを行えるようにする
(define-key global-map (kbd "C-M-z") 'undo-tree-redo)

;; markdown-mode
;; TODO M-n M-p が衝突していると思うので削除する
(el-get-bundle markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; scala-mode2
(el-get-bundle scala-mode2)

;; javadocとscaladocでは微妙にフォーマットが違うっぽい？
;; javadoc-style を採用
(setq scala-indent:use-javadoc-style t)

;; csharp-mode
;; https://github.com/josteink/csharp-mode
(el-get-bundle josteink/csharp-mode)

;; web-mode
(el-get-bundle web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))

;; web-modeのインデント関係
(defun web-mode-hook ()
"Hooks for Web mode."
(setq web-mode-html-offset 4)
(setq web-mode-css-offset 4)
(setq web-mode-script-offset 4)
(setq web-mode-php-offset 4)
(setq web-mode-java-offset 4)
(setq web-mode-asp-offset 4)
(setq indent-tabs-mode t)
(setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)
;; scala.htmlだけはweb-mode-htmlで正しく表示できないので、html-modeをつかう
;; ただしhtml-modeでも
(add-to-list 'auto-mode-alist '("\\.scala.html$" . html-mode))

;; Haskell-mode
(el-get-bundle haskell-mode)
;; Haskell.
(require 'haskell-cabal)

(add-to-list 'load-path "~/.emacs.d/elisp/haskell-mode-2.8.0")
(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))     ;#!/usr/bin/env runghc 用       
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode)) ;#!/usr/bin/env runhaskell 用

(el-get-bundle clojure-mode)
(el-get-bundle cider)
(el-get-bundle ac-cider)
(el-get-bundle clojure-cheatsheet)
(el-get-bundle slamhound)
(el-get-bundle smartparens)

(add-hook 'clojure-mode-hook 'cider-mode)

;; mini bufferに関数の引数を表示させる
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; 'C-x b' した時に *nrepl-connection* と *nrepl-server* のbufferを一覧に表示しない
(setq nrepl-hide-special-buffers t)

;; RELPのbuffer名を 'project名:nREPLのport番号' と表示する
;; project名は project.clj で defproject した名前
(setq nrepl-buffer-name-show-port t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

;; Org-mode
(el-get-bundle org-mode)
;;; Org-Mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; (setq org-capture-templates
;;       '(("t" "Todo" entry (file+headline "~/Dropbox/MEMO/gtd.org" "Tasks")
;;      "* TODO %?\n  %i\n  %a")
;;         ("j" "Journal" entry (file+datetree "~/Dropbox/MEMO/journal.org")
;;      "* %?\nEntered on %U\n  %i\n  %a")))

;; capture templates
(setq org-capture-templates
      '(("p" "Project Task"
         entry (file+headline (expand-file-name "~/Dropbox/org/newgtd.org") "Inbox")
             "** TODO %?\n    %i\n    %a\n    %T")
        ("m" "memo"
         entry (file (expand-file-name "~/Dropbox/org/memo.org"))
             "* %?\n    %i\n    %a\n    %T")))


;; agenda
(setq org-agenda-files (list (expand-file-name "~/Dropbox/org")))
(setq org-tag-faces
       '(("Doing" :foreground "#FF0000")))

;; (setq org-agenda-files
;;       '("~/Dropbox/org/org-ical.org"
;;      "~/Dropbox/org/next.org"
;;         "~/Dropbox/org/today.org"
;;         "~/Dropbox/org/work.org"
;;      "~/Dropbox/org/research.org"))
;; (defun my-sparse-doing-tree ()
;;   (interactive)
;;   (org-tags-view nil "Doing"))
;; (define-key org-mode-map (kbd "C-c 3") 'my-sparse-doing-tree)

;; DONEの時刻を記録
(setq org-log-done 'time)

;; 習慣(habits)の記録を行う場合は，以下の行を追加する．
(require 'org-habit)


