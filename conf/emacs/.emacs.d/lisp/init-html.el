;;; init-html.el --- Editing HTML                    -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

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

(provide 'init-html)
;;; init-html.el ends here
