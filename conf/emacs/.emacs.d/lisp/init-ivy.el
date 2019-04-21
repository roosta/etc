;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ivy
             :ensure t
             :init
             (setq ivy-use-virtual-buffers t)
             (setq projectile-completion-system 'ivy)
             (setq ivy-count-format "(%d/%d) ")
             :config
             (ivy-mode 1))

(use-package counsel :ensure t)

(use-package projectile
             :ensure t
             :config
             (projectile-mode +1))

(defun roosta/org-find-files ()
  "Quickly search in org folder"
  (interactive)
  (let ((default-directory "~/org"))
    (projectile--find-file)))

(general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "C-SPC"

  "/"   'counsel-ag
  "TAB" '(switch-to-other-buffer :which-key "prev buffer")
  "SPC" 'counsel-M-x
  "hdf" 'counsel-describe-function
  "hdv" 'counsel-describe-variable
  "oo" 'projectile--find-file
  "oi" 'roosta/org-find-files
  "bb" 'counsel-ibuffer
  )



(provide 'init-ivy)
;;; init-ivy.el ends here
