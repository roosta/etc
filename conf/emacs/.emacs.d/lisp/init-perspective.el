;;; init-perspective.el --- Setup perspectives       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package perspective
  :demand t
  :commands
  (persp-mode)
  :config
  (persp-mode))

(use-package persp-projectile
  :general
  ('(normal visual evilified) :prefix "SPC" :non-normal-prefix "C-SPC"
   "pl" #'projectile-persp-switch-project))

(provide 'init-perspective)
;;; init-perspective.el ends here
