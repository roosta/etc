;;; init-markdown.el --- Markdown support            -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :commands
  (markdown-mode
   gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :general
  ('(normal visual evilified) markdown-mode-map :prefix ","
   ;; Movement
   "{" #'markdown-backward-paragraph
   "}" #'markdown-forward-paragraph
   ;; Completion, and Cycling
   "]" #'markdown-complete
   ;; Indentation
   ">" #'markdown-indent-region
   "<" #'markdown-exdent-region
   ;; Buffer-wide commands
   "c]" #'markdown-complete-buffer
   "cc" #'markdown-check-refs
   "ce" #'markdown-export
   "cm" #'markdown-other-window
   "cn" #'markdown-cleanup-list-numbers
   "co" #'markdown-open
   "cp" #'markdown-preview
   "cv" #'markdown-export-and-preview
   "cw" #'markdown-kill-ring-save
   ;; headings
   "hi" #'markdown-insert-header-dwim
   "hI" #'markdown-insert-header-setext-dwim
   "h1" #'markdown-insert-header-atx-1
   "h2" #'markdown-insert-header-atx-2
   "h3" #'markdown-insert-header-atx-3
   "h4" #'markdown-insert-header-atx-4
   "h5" #'markdown-insert-header-atx-5
   "h6" #'markdown-insert-header-atx-6
   "h!" #'markdown-insert-header-setext-1
   "h@" #'markdown-insert-header-setext-2
   ;; Insertion of common elements
   "-"  #'markdown-insert-hr
   "if" #'markdown-insert-footnote
   "ii" #'markdown-insert-image
   "ik" #'spacemacs/insert-keybinding-markdown
   "iI" #'markdown-insert-reference-image
   "il" #'markdown-insert-link
   "iL" #'markdown-insert-reference-link-dwim
   "iw" #'markdown-insert-wiki-link
   "iu" #'markdown-insert-uri
   ;; Element removal
   "k" #'markdown-kill-thing-at-point
   ;; List editing
   "li" #'markdown-insert-list-item
   ;; region manipulation
   "xb" #'markdown-insert-bold
   "xi" #'markdown-insert-italic
   "xc" #'markdown-insert-code
   "xC" #'markdown-insert-gfm-code-block
   "xq" #'markdown-insert-blockquote
   "xQ" #'markdown-blockquote-region
   "xp" #'markdown-insert-pre
   "xP" #'markdown-pre-region
   ;; Following and Jumping
   "N" #'markdown-next-link
   "f" #'markdown-follow-thing-at-point
   "P" #'markdown-previous-link
   "<RET>" #'markdown-jump)
  ('(normal) markdown-mode-map
   "gj" #'outline-forward-same-level
   "gk" #'outline-backward-same-level
   "gh" #'outline-up-heading
   "gl" #'outline-next-visible-heading)
  (markdown-mode-map
   "M-h" #'markdown-promote
   "M-j" #'markdown-move-down
   "M-k" #'markdown-move-up
   "M-l" #'markdown-demote)
  :config
  (which-key-add-major-mode-key-based-replacements 'markdown-mode
    ", c" "markdown/command"
    ", h" "markdown/header"
    ", i" "markdown/insert"
    ", l" "markdown/lists"
    ", x" "markdown/text"))

(provide 'init-markdown)
;;; init-markdown.el ends here
