;;; init-yasnippet.el --- Yasnippet template system  -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
  :general
  ('(normal visual insert emacs)
   "<backtab>" #'yas-prev-field)
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after (yasnippet))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
