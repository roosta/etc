;;; init-lsp.el --- Language server protocol for emacs  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; https://github.com/MaskRay/ccls/wiki/lsp-mode
(use-package lsp-mode
  :commands
  lsp
  :custom
  (lsp-keymap-prefix "C-c C-f")
  (lsp-prefer-flymake nil) ;; Prefer flycheck
  :hook
  ((js-mode
    js2-mode
    typescript-mode
    python-mode
    web-mode
    c-mode
    c++-mode
    objc-mode) . lsp)
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui :after lsp-mode :commands lsp-ui-mode)

(provide 'init-lsp)
;;; init-lsp.el ends here
