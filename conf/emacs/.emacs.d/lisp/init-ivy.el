;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ivy
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq projectile-completion-system 'ivy)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1)
  :general
  ('(normal visual insert emacs) :prefix "SPC"
   "ss" #'(swiper :which-key "Search buffer")
   "rs" #'ivy-resume))

(setq counsel-ag-command "ag --nocolor --nogroup --hidden %s")
(setq counsel-ag-base-command "ag --nocolor --nogroup --hidden %s")

(use-package counsel
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "SPC"
   "/"   #'(counsel-ag :which-key "Search project")
   "?"   #'(counsel-descbinds :which-key "Describe keybindings")
   "ff"  #'(counsel-find-files :which-key "Find files")
   "SPC" #'(counsel-M-x :which-key "M-x")
   "hdf" #'(counsel-describe-function :which-key "Describe function")
   "hdv" #'(counsel-describe-variable :which-key "Describe variable")
   "ji"  #'counsel-imenu
   "bb"  #'counsel-ibuffer
   "ry"  #'counsel-yank-pop
   "ic"  #'ivy-immediate-done
   ))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode +1)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "SPC"
   "oo" #'projectile--find-file))

(defun roosta/org-find-files ()
  "Quickly search in org folder"
  (interactive)
  (let ((default-directory "~/org"))
    (projectile-find-file)))

(general-def '(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "SPC"
  "oi" #'roosta/org-find-files)

;; (general-define-key
;;  :states '(normal visual insert emacs)
;;  :prefix "SPC"
;;  :non-normal-prefix "C-SPC"

;;  "/"   '(counsel-ag :which-key "Search project")
;;  "?"   '(counsel-descbinds :which-key "Describe keybindings")
;;  "ss"  '(swiper :which-key "Search buffer")
;;  "ff"  '(counsel-find-files :which-key "Find files")
;;  "SPC" '(counsel-M-x :which-key "M-x")
;;  "hdf" '(counsel-describe-function :which-key "Describe function")
;;  "hdv" '(counsel-describe-variable :which-key "Describe variable")
;;  "ji"  'counsel-imenu
;;  "oo"  'projectile--find-file
;;  "oi"  'roosta/org-find-files
;;  "bb"  'counsel-ibuffer
;;  "rs"  'ivy-resume
;;  "ry"  'counsel-yank-pop
;;  "ic"  'ivy-immediate-done
;;  )

(provide 'init-ivy)
;;; init-ivy.el ends here
