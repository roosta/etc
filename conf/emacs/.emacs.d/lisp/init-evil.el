;;; init-evil.el --- Configure the extensible vi layer for Emacs.  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;----------------------------------------------------------------------------
;; Setup evil
;;----------------------------------------------------------------------------
(use-package evil
  :demand t
  :defines
  (evil-want-Y-yank-to-eol)
  :init
  (setq evil-ex-search-vim-style-regexp t)
  (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil) ;; required by evil-collection
  (setq evil-want-C-u-scroll t)
  (setq evil-move-beyond-eol t)
  (setq evil-want-Y-yank-to-eol t) ;; Yank to end of line with Y instead of whole line
  :general
  ('(normal)
   "j" 'evil-next-visual-line
   "k" 'evil-previous-visual-line)
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "sc" #'evil-ex-nohighlight)
  :config
  (evil-mode))

;;----------------------------------------------------------------------------
;; Extra plugins
;;----------------------------------------------------------------------------
(use-package evil-collection
  :after (evil)
  :custom (evil-collection-setup-minibuffer t)
  :config (evil-collection-init))

(use-package evil-surround
  :config (global-evil-surround-mode))

(use-package evil-commentary
  :diminish evil-commentary-mode
  :config (evil-commentary-mode))

(use-package evil-snipe
  :init
  (setq evil-snipe-scope 'whole-buffer)
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1)
  (diminish 'evil-snipe-mode)
  (diminish 'evil-snipe-local-mode)
  (diminish 'evil-snipe-override-mode)
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
  (add-hook 'git-rebase-mode-hook 'turn-off-evil-snipe-mode))

(use-package evil-traces
  :demand t
  :commands
  (evil-traces-use-diff-faces
   evil-traces-mode)
  :config
  (evil-traces-use-diff-faces) ; if you want to use diff's faces
  (evil-traces-mode))

;;----------------------------------------------------------------------------
;; evil-mc
;;----------------------------------------------------------------------------
(use-package evil-mc
  :config
  (global-evil-mc-mode 1))

;;----------------------------------------------------------------------------
;; evil-matchit
;;----------------------------------------------------------------------------
(use-package evil-matchit
  :commands
  (global-evil-matchit-mode)
  :config
  (global-evil-matchit-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here
