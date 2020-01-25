;;; init-compilation.el --- Compilation preferences  -*- lexical-binding: t; -*-
;;; Commentary:

;;

;;; Code:

(ignore-errors
  (require 'ansi-color)
  (defun roosta/colorize-compilation-buffer ()
    "Interpret ANSI escape sequences."
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'roosta/colorize-compilation-buffer))


(provide 'init-compilation)
;;; init-compilation.el ends here
