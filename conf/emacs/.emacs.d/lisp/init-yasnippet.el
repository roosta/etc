;;; init-yasnippet.el --- Yasnippet template system  -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package yasnippet
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after (yasnippet))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
