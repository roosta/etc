;;; init-folding.el --- Setup code and region folding  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(use-package origami
  :init
  (setq origami-fold-style 'triple-braces)
  :functions (global-origami-mode)
  :defines origami-fold-style
  :diminish origami-mode
  :config
  (global-origami-mode))


(provide 'init-folding)
;;; init-folding.el ends here
