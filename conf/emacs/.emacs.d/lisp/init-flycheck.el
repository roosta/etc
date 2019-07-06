;;; init-flycheck.el --- Configure flycheck              -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(use-package flycheck
  :init
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode))

(use-package flycheck-joker
  :after
  (flycheck))

(use-package flycheck-clj-kondo
  :after (flycheck)
  :commands
  (flycheck-add-next-checker)
  :config
  (dolist (checkers '((clj-kondo-clj . clojure-joker)
                      (clj-kondo-cljs . clojurescript-joker)
                      (clj-kondo-cljc . clojure-joker)))
    (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers)))))

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

(defun flycheck-disable-on-temp-buffers ()
  "Disable flycheck in temporary buffers."
  (unless (and buffer-file-name (file-exists-p buffer-file-name))
    (flycheck-mode -1)))

(add-hook 'markdown-mode-hook #'flycheck-disable-on-temp-buffers)
(add-hook 'clojure-mode-hook #'flycheck-disable-on-temp-buffers)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
