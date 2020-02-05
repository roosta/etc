;;; init-editing-utils.el --- Editing utils and defaults  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Daniel Berg

;; Author: Daniel Berg <mail@roosta.sh>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

;;----------------------------------------------------------------------------
;; Saveplace
;;----------------------------------------------------------------------------
;; The saveplace library saves the location of the point when you kill a buffer
;; and returns to it next time you visit the associated file.
(save-place-mode 1)

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------

(setq save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      column-number-mode t
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
;; Modes and hooks
;;----------------------------------------------------------------------------
(global-hl-line-mode 1)
(global-subword-mode t)
(diminish 'subword-mode)

;; Clear trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;----------------------------------------------------------------------------
;; Relative line numbering
;;----------------------------------------------------------------------------
(defvar display-line-numbers-type)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))

;;----------------------------------------------------------------------------
;; Quickly switch to scratch buffer
;;----------------------------------------------------------------------------
(defun roosta/switch-to-scratch-buffer ()
  "Switch to the `*scratch*' buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

;;----------------------------------------------------------------------------
;; dumb-jump
;;----------------------------------------------------------------------------

(use-package dumb-jump
  :defines
  (dumb-jump-selector)
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
 "hdm" #'(describe-mode :which-key "Describe mode")
 "qq"  #'save-buffers-kill-emacs
 "bs"  #'(roosta/switch-to-scratch-buffer :which-key "*scratch*")
 "bd"  #'kill-this-buffer
 "u"   #'universal-argument)

;;----------------------------------------------------------------------------
;; visual-line-mode
;;----------------------------------------------------------------------------

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq fill-column 80)

(use-package visual-fill-column
  :commands
  (visual-fill-column-adjust)
  :hook
  (visual-line-mode . visual-fill-column-mode)
  :config
  ;; https://github.com/joostkremers/visual-fill-column#adjusting-text-size
  (advice-add 'text-scale-adjust :after #'visual-fill-column-adjust))

(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

;;----------------------------------------------------------------------------
;; Indentation
;;----------------------------------------------------------------------------

(setq-default indent-tabs-mode nil)

(defun roosta/setup-indent (n)
  "Generalized setup indentation.
Takes N indentation width."

  ;; defaults
  (setq-local tab-width n)

  ;; java/c/c++
  (setq-local c-basic-offset n)

  ;; web development
  (setq-local javascript-indent-level n)
  (setq-local js-indent-level n)
  ;; (setq-local js2-basic-offset n)
  (setq-local web-mode-markup-indent-offset n)
  (setq-local web-mode-css-indent-offset n)
  (setq-local web-mode-code-indent-offset n)
  (setq-local css-indent-offset n)
  (setq-local json-reformat:indent-width n)

  ;; shell  script
  (setq-local sh-basic-offset n)
  ;; (setq-local sh-indentation n)
  )

(defun roosta/personal-code-style ()
  "Personal code style."
  (interactive)
  (message "Personal code style")
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (roosta/setup-indent 2))

(defun roosta/make-code-style ()
  "Makefile indentation rules."
  (setq indent-tabs-mode t)
  (setq-local tab-width 2))

(add-hook 'prog-mode-hook #'roosta/personal-code-style)
(add-hook 'web-mode-hook #'roosta/personal-code-style)
(add-hook 'makefile-mode-hook #'roosta/make-code-style)

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
