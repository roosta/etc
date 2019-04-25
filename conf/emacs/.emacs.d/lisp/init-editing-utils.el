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
;; Define emacs keybinding overrides
;;----------------------------------------------------------------------------
(general-define-key
 "M-/" 'hippie-expand
 "C-x C-b" 'ibuffer)

;;----------------------------------------------------------------------------
;; Show matching parens
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook 'show-paren-mode)

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
