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
;; Show matching parens
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook 'show-paren-mode)

;;----------------------------------------------------------------------------
;; Use relative line numbering
;;----------------------------------------------------------------------------
(use-package linum-relative
  :ensure t
  :init
  (setq linum-relative-format "%3s ")
  (setq linum-relative-backend 'display-line-numbers-mode)
  :config
  (require 'linum-relative)
  (linum-relative-global-mode))

;;----------------------------------------------------------------------------
;; Quickly switch to scratch buffer
;;----------------------------------------------------------------------------
(defun roosta/switch-to-scratch-buffer ()
  "Switch to the `*scratch*' buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))


;;----------------------------------------------------------------------------
;; General keybindings
;;----------------------------------------------------------------------------

(general-define-key
 "M-/" #'hippie-expand
 "C-x C-b" #'ibuffer)

(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "C-SPC"
 "TAB" #'(switch-to-other-buffer :which-key "prev buffer")
 "qq"  #'save-buffers-kill-emacs
 "bs"  #'(roosta/switch-to-scratch-buffer :which-key "*scratch*"))

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
