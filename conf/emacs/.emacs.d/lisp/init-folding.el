;;; init-folding.el --- Setup code and region folding  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(use-package origami
  :defer nil
  :commands (origami-mode origami-close-all-nodes)
  :defines (origami-fold-style)
  :config
  (defun roosta/enable-folding ()
    "Enable vim-like folding."
    (setq-local origami-fold-style 'triple-braces)
    (origami-mode)
    (origami-close-all-nodes (current-buffer)))
  (add-hook 'prog-mode-hook 'roosta/enable-folding)
  (add-hook 'conf-mode-hook 'roosta/enable-folding))


(provide 'init-folding)
;;; init-folding.el ends here
