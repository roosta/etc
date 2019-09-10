;;; init-yasnippet.el --- Yasnippet template system  -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package yasnippet
  :diminish (yas-minor-mode . "[y]")
  :init
  ;; Use hippie expand to expand snippets
  (setq hippie-expand-try-functions-list
        (cons 'yas/hippie-try-expand hippie-expand-try-functions-list))

  ;; Custom snippets
  (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after (yasnippet))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
