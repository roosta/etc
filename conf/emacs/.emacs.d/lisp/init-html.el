;;; init-html.el --- Editing HTML                    -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package sass-mode
  :defer t
  :mode ("\\.sass\\'" . sass-mode))

(use-package scss-mode
    :defer t
    :mode ("\\.scss\\'" . scss-mode))

;;----------------------------------------------------------------------------
;; emmet
;;----------------------------------------------------------------------------
(defun spacemacs/emmet-expand ()
  "Use yas if exist."
  (interactive)
  (if (bound-and-true-p yas-minor-mode)
      (call-interactively 'emmet-expand-yas)
    (call-interactively 'emmet-expand-line)))

(use-package emmet-mode
  :general
  ('(normal insert emacs hybrid) emmet-mode-keymap
   "TAB" 'spacemacs/emmet-expand
   "tab" 'spacemacs/emmet-expand)
  :hook ((html-mode . emmet-mode)
         (css-mode  . emmet-mode)
         (sgml-mode . emmet-mode)
         (sass-mode . emmet-mode)
         (web-mode  . emmet-mode)
         (scss-mode . emmet-mode)))

;;----------------------------------------------------------------------------
;; tagedit
;;----------------------------------------------------------------------------
(use-package tagedit
  :hook (html-mode . tagedit-mode)
  :general
  ('(normal insert emacs hybrid) html-mode-map
   ">" #'tagedit-forward-slurp-tag
   "<" #'tagedit-forward-barf-tag
   "M-r" #'tagedit-raise-tag
   "M-s" #'tagedit-splice-tag
   "M-J" #'tagedit-join-tags
   "M-S" #'tagedit-split-tag
   "M-?" #'tagedit-convolute-tags
   "M-d" #'tagedit-kill
   "M-a" #'tagedit-kill-attribute))

(provide 'init-html)
;;; init-html.el ends here
