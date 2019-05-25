;;; init-editing-utils.el --- Editing utils and defaults  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;----------------------------------------------------------------------------
;; Saveplace
;;----------------------------------------------------------------------------
;; The saveplace library saves the location of the point when you kill a buffer
;; and returns to it next time you visit the associated file.
(require 'saveplace)
(setq-default save-place t)

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------

(setq-default indent-tabs-mode nil)

(defvar apropos-do-all)
(defvar ediff-window-setup-function)

(setq save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      scroll-margin 7
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;;----------------------------------------------------------------------------
;; Smooth scrolling
;; https://www.emacswiki.org/emacs/SmoothScrolling
;; scroll one line at a time (less "jumpy" than defaults)
;;----------------------------------------------------------------------------

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't ;; scroll window under mouse
      scroll-step 1  ;; keyboard scroll one line at a time
      scroll-conservatively 10000 ;; scroll one line at a time when you move the cursor past the top or bottom of the window,
      )

;;----------------------------------------------------------------------------
;; Globally enable hl-line-mode
;;----------------------------------------------------------------------------
(global-hl-line-mode 1)


;;----------------------------------------------------------------------------
;; Relative line numbering
;;----------------------------------------------------------------------------
(defvar display-line-numbers-type)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)


;;----------------------------------------------------------------------------
;; Quickly switch to scratch buffer
;;----------------------------------------------------------------------------
(defun roosta/switch-to-scratch-buffer ()
  "Switch to the `*scratch*' buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

;;----------------------------------------------------------------------------
;; Setup dumb jump
;;----------------------------------------------------------------------------

(use-package dumb-jump
  :defer t
  :defines dumb-jump-selector
  :config
  (setq dumb-jump-selector 'ivy)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "jq" #'dumb-jump-quick-look
   "jj" #'dumb-jump-go
   "jb" #'dumb-jump-back))


;;----------------------------------------------------------------------------
;; General keybindings
;;----------------------------------------------------------------------------

(general-def
 "M-/"     #'hippie-expand
 "C-x C-b" #'ibuffer)

(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "C-SPC"
 "TAB" #'(switch-to-other-buffer :which-key "prev buffer")
 "hh"  #'help-command
 "sc"  'evil-ex-nohighlight
 "qq"  #'save-buffers-kill-emacs
 "bs"  #'(roosta/switch-to-scratch-buffer :which-key "*scratch*")
 "bd"  #'kill-this-buffer
 "u"   #'universal-argument)

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
