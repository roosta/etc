;;; init-hl-todo.el --- Highlight todo and other keywords in buffers  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package hl-todo
  :init
  (setq hl-todo-keyword-faces
        '(("HOLD" . "#D75F00")
          ("TODO" . "#FED06E")
          ("NEXT" . "#FF5C8F")
          ("THEM" . "#FF5C8F")
          ("PROG" . "#53FDE9")
          ("OKAY" . "#53FDE9")
          ("DONT" . "#F75341")
          ("FAIL" . "#F75341")
          ("DONE" . "#98BC37")
          ("NOTE" . "#FED06E")
          ("KLUDGE" . "#FF8700")
          ("HACK" . "#FF8700")
          ("TEMP" . "#68A8E4")
          ("FIXME" . "#FF5C8F")
          ("XXX" . "#FF5C8F")
          ("XXXX" . "#FF5C8F")
          ("???" . "#68A8E4")))
  :commands
  (global-hl-todo-mode)
  :defer nil
  :config
  (global-hl-todo-mode))

(provide 'init-hl-todo)
;;; init-hl-todo.el ends here
