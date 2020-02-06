;;; init-flycheck.el --- Configure flycheck              -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(use-package flycheck
  :diminish flycheck-mode
  :defer t
  :hook
  (prog-mode . flycheck-mode)
  ((markdown-mode clojure-mode) . flycheck//disable-on-temp-buffers)
  :init
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :commands
  (flycheck-add-next-checker)
  :config
  (defun flycheck//disable-on-temp-buffers ()
    "Disable flycheck in temporary buffers."
    (unless (and buffer-file-name (file-exists-p buffer-file-name))
      (flycheck-mode -1))))

(use-package flycheck-popup-tip
  :after
  (flycheck)
  :config
  (flycheck-popup-tip-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
