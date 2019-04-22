;;; init-evil.el --- Configure the extensible vi layer for Emacs.  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package evil
  :ensure t
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
  :ensure t
  :config (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config (global-evil-surround-mode))

(use-package nlinum-relative
  :ensure t
  :init
  (setq nlinum-relative-current-symbol "")
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-format "%3s ")
  :config
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (add-hook 'text-mode-hook 'nlinum-relative-mode))

(use-package evil-commentary
  :ensure t
  :diminish evil-commentary-mode
  :config (evil-commentary-mode))

(use-package evil-snipe
  :ensure t
  :diminish evil-snipe-mode
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(provide 'init-evil)
;;; init-evil.el ends here
