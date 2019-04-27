;;; init-evil.el --- Configure the extensible vi layer for Emacs.  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package evil
  :init
  (setq evil-ex-search-vim-style-regexp t)
  (setq evil-want-keybinding nil) ;; required by evil-collection
  (setq evil-want-C-u-scroll t)
  (setq evil-move-beyond-eol t)
  :config
  (evil-mode)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "M-o") 'evil-jump-forward)
  )

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
  (diminish 'evil-snipe-mode)
  (diminish 'evil-snipe-local-mode)
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
  (add-hook 'git-rebase-mode-hook 'turn-off-evil-snipe-mode))


(provide 'init-evil)
;;; init-evil.el ends here
