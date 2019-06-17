;;; init-undo-tree.el --- Defaults for undo-tree -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar emacs-undo-tree-history-directory (expand-file-name "var/undo" user-emacs-directory))
(make-directory emacs-undo-tree-history-directory t)

(defvar undo-tree-auto-save-history)
(defvar undo-tree-history-directory-alist)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist `(("." . ,emacs-undo-tree-history-directory)))
(diminish 'undo-tree-mode)

(general-unbind undo-tree-map
  :with 'ignore
  [remap undo-tree-undo])

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
