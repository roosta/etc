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

;;----------------------------------------------------------------------------
;; CSS
;;----------------------------------------------------------------------------
(use-package sass-mode
  :defer t
  :mode ("\\.sass\\'" . sass-mode))

(use-package scss-mode
    :defer t
    :mode ("\\.scss\\'" . scss-mode))

(defun css-expand-statement ()
  "Expand CSS block."
  (interactive)
  (save-excursion
    (end-of-line)
    (search-backward "{")
    (forward-char 1)
    (while (or (eobp) (not (looking-at "}")))
      (let ((beg (point)))
        (newline)
        (search-forward ";")
        (indent-region beg (point))
        ))
    (newline)))

(defun css-contract-statement ()
  "Contract CSS block."
  (interactive)
  (end-of-line)
  (search-backward "{")
  (while (not (looking-at "}"))
    (join-line -1)))

(general-define-key
 :states  '(normal visual evilified)
 :keymaps '(css-mode-map)
 :prefix  ","
 "zc" #'css-contract-statement
 "zo" #'css-expand-statement)

;;----------------------------------------------------------------------------
;; Web-mode
;;----------------------------------------------------------------------------
(use-package web-mode
  :mode
  (("\\.phtml\\'"      . web-mode)
   ("\\.tpl\\.php\\'"  . web-mode)
   ("\\.twig\\'"       . web-mode)
   ("\\.html\\'"       . web-mode)
   ("\\.htm\\'"        . web-mode)
   ("\\.[gj]sp\\'"     . web-mode)
   ("\\.as[cp]x?\\'"   . web-mode)
   ("\\.eex\\'"        . web-mode)
   ("\\.erb\\'"        . web-mode)
   ("\\.mustache\\'"   . web-mode)
   ("\\.handlebars\\'" . web-mode)
   ("\\.hbs\\'"        . web-mode)
   ("\\.eco\\'"        . web-mode)
   ("\\.ejs\\'"        . web-mode)
   ("\\.djhtml\\'"     . web-mode))
  :general
  ('(normal visual evilified) web-mode-map :prefix ","
   "eh" 'web-mode-dom-errors-show
   "gb" 'web-mode-element-beginning
   "gc" 'web-mode-element-child
   "gp" 'web-mode-element-parent
   "gs" 'web-mode-element-sibling-next
   "hp" 'web-mode-dom-xpath
   "rc" 'web-mode-element-clone
   "rd" 'web-mode-element-vanish
   "rk" 'web-mode-element-kill
   "rr" 'web-mode-element-rename
   "rw" 'web-mode-element-wrap
   "z" 'web-mode-fold-or-unfold))

(which-key-add-major-mode-key-based-replacements 'web-mode
  ", e" "errors"
  ", g" "goto"
  ", h" "dom"
  ", r" "refactor")

(which-key-add-major-mode-key-based-replacements 'css-mode
  ", z" "contract/expand")

(provide 'init-html)
;;; init-html.el ends here
