;;; init-cpp.el ---                                -*- lexical-binding: t; -*-

;;; Commentary:
;; https://github.com/MaskRay/ccls/wiki/lsp-mode
;; https://www.reddit.com/r/emacs/comments/dlf0w7/whats_your_setup_for_cc_in_emacs/
;;; Code:

(use-package lsp-mode :commands lsp
  :init
  (setq lsp-keymap-prefix "SPC k")
  (setq lsp-prefer-flymake nil)
  :hook
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui :commands lsp-ui-mode)

(use-package ccls
  :custom
  (ccls-executable (executable-find "ccls")) ; Add ccls to path if you haven't done so
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(use-package modern-cpp-font-lock
  :commands
  (modern-c++-font-lock-global-mode)
  :diminish t
  :init (modern-c++-font-lock-global-mode t))

(use-package cmake-mode)

(provide 'init-cpp)
;;; init-cpp.el ends here
