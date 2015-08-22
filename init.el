;;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; ~/.emacs.d/
(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory (expand-file-name "~/.emacs.d/")))

;;; ユーザー情報
(setq user-full-name "Naoya ISHII")
(setq user-mail-address "naopi.chan@gmail.com")


(unless (package-installed-p 'helm)
  (package-refresh-contents) (package-install 'helm))
(require 'helm)
(helm-mode 1)
(define-key global-map (kbd "C-x C-o") 'helm-mini)

;;;
;;; カラーテーマ
;;;
(unless (package-installed-p 'atom-dark-theme)
  (package-refresh-contents) (package-install 'atom-dark-theme))
(load-theme 'atom-dark t)

;;;
;;; git操作
;;;
(unless (package-installed-p 'magit)
  (package-refresh-contents) (package-install 'magit))

;;;
;;; Tree type FileManager
;;;
(unless (package-installed-p 'neotree)
  (package-refresh-contents) (package-install 'neotree))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;;
;;; Font
;;;
(set-default-font "Inconsolata-11")
(set-face-font 'variable-pitch "Inconsolata-11")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("Takaoゴシック" . "unicode-bmp")
)

;;;
;;; clojure
;;;
(defvar clojure-packages '(clojure-mode
                           paredit
                           cider
                           rainbow-delimiters))
(dolist (p clojure-packages)
  (when (not (package-installed-p p))
    (package-refresh-contents)
    (package-install p)))
    
(defvar clojure-minor-modes '(paredit-mode
                              rainbow-delimiters-mode))
(dolist (mode clojure-minor-modes)
  (add-hook 'clojure-mode-hook mode)
  (add-hook 'cider-repl-mode-hook mode))
