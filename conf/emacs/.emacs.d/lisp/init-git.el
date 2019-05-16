;;; init-git.el --- Git SCM support -*- lexical-binding: t -*-
;;; Commentary:

;; See also init-github.el.

;;; Code:

(use-package magit
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "gb"  #'magit-blame
   "gfh" #'magit-log-buffer-file
   "gm"  #'magit-dispatch-popup
   "gs"  #'magit-status
   "gS"  #'magit-stage-file
   "gU"  #'magit-unstage-file))

(use-package evil-magit
  :after (magit))

;; Use auto commit for org-mode
(use-package git-auto-commit-mode)

(provide 'init-git)
;;; init-git.el ends here
