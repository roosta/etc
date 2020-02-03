;;; init-cpp.el ---                                -*- lexical-binding: t; -*-

;;; Commentary:
;; https://github.com/MaskRay/ccls/wiki/lsp-mode
;; https://www.reddit.com/r/emacs/comments/dlf0w7/whats_your_setup_for_cc_in_emacs/
;;; Code:

(require 'init-site-lisp)

(use-package lsp-mode :commands lsp)
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

;; CMake mode
(ensure-lib-from-url
 'cmake-mode
 "https://raw.githubusercontent.com/Kitware/CMake/master/Auxiliary/cmake-mode.el")

(require 'cmake-mode)

(provide 'init-cpp)
;;; init-cpp.el ends here
