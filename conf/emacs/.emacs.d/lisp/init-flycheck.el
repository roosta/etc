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

;; (use-package flycheck-joker
;;   :after
;;   (flycheck))

;; (use-package flycheck-clj-kondo
;;   :after (flycheck)
;;   :config
;;   (dolist (checkers '((clj-kondo-clj . clojure-joker)
;;                       (clj-kondo-cljs . clojurescript-joker)
;;                       (clj-kondo-cljc . clojure-joker)))
;;     (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers)))))

(use-package package-lint)

(use-package flycheck-popup-tip
  :after
  (flycheck)
  :config
  (flycheck-popup-tip-mode))

(use-package flycheck-package
  :after
  (flycheck package-lint)
  :config
  (flycheck-package-setup))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
