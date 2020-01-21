;;; init-c-cpp.el ---                                -*- lexical-binding: t; -*-

;;; Commentary:
;; https://github.com/MaskRay/ccls/wiki/lsp-mode
;; https://www.reddit.com/r/emacs/comments/dlf0w7/whats_your_setup_for_cc_in_emacs/
;;; Code:

(use-package lsp-mode :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(provide 'init-c-cpp)
;;; init-c-cpp.el ends here
