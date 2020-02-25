;;; init-folding.el --- Setup code and region folding  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(use-package origami
  :config
  (add-hook 'prog-mode-hook
            (lambda ()
              (setq-local origami-fold-style 'triple-braces)
              (origami-mode)
              (origami-close-all-nodes (current-buffer)))))


(provide 'init-folding)
;;; init-folding.el ends here
