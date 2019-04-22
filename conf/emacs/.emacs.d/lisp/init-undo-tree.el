;;; init-undo-tree.el --- Defaults for undo-tree -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/var/emacs/undo")))
(diminish 'undo-tree-mode)

(provide 'init-undo-tree)
;;; init-themes.el ends here
