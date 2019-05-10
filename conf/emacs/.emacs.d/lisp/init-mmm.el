;;; init-mmm.el --- Multiple major mode setup        -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package mmm-mode
  :init
  (setq mmm-global-mode 'buffers-with-submode-classes)
  (setq mmm-submode-decoration-level 2)
  :config
  (require 'mmm-auto))


(provide 'init-mmm)
;;; init-mmm.el ends here
