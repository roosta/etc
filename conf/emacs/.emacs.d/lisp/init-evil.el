;;; init-evil.el --- Configure the extensible vi layer for Emacs.  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package evil
             :ensure t
             :init
             (setq evil-ex-search-vim-style-regexp t)
             (setq evil-want-keybinding nil) ;; required by evil-collection
             (setq evil-move-beyond-eol t)
             :bind (:map evil-normal-state-map
                         ("j" . evil-next-visual-line)
                         ("k" . evil-previous-visual-line)
                         ("M-o" . evil-jump-forward))
             :config
             (evil-mode))

(use-package evil-collection
             :after (evil)
             :custom (evil-collection-setup-minibuffer t)
             :ensure t
             :config
             (evil-collection-init))


(provide 'init-evil)
;;; init-evil.el ends here
