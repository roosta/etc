;;; init-yasnippet.el --- Yasnippet template system  -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode
  :init
  ;; Use hippie expand to expand snippets
  (setq hippie-expand-try-functions-list
        (cons 'yas/hippie-try-expand hippie-expand-try-functions-list))

  ;; Custom snippets
  (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
  :general
  ('(normal visual insert emacs)
   "<backtab>" #'yas-prev-field)
  :config
  (yas-global-mode 1))

(use-package auto-yasnippet
  :general
  ('(normal visual insert emacs)
   "C-;" #'aya-open-line)
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "iw" #'aya-create
   "iy" #'aya-expand))

(use-package yasnippet-snippets
  :after (yasnippet))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
