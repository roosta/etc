;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ivy
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq projectile-completion-system 'ivy)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-use-selectable-prompt t) ; see ivy FAQ
  :config
  (ivy-mode 1)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "ss" #'(swiper :which-key "Search buffer")
   "rs" #'ivy-resume)
  ('(insert normal) ivy-minibuffer-map
   "C-j" #'ivy-next-line
   "C-k" #'ivy-previous-line
   "C-d" #'ivy-scroll-up-command
   "C-u" #'ivy-scroll-down-command))

;;----------------------------------------------------------------------------
;; Setup counsel
;;----------------------------------------------------------------------------
(use-package counsel
  :init
  (setq counsel-ag-command "ag --nocolor --nogroup --hidden %s")
  (setq counsel-ag-base-command "ag --nocolor --nogroup --hidden %s")
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "/"   #'(counsel-ag :which-key "Search project")
   "?"   #'(counsel-descbinds :which-key "Describe keybindings")
   "ff"  #'(counsel-find-files :which-key "Find files")
   "SPC" #'(counsel-M-x :which-key "M-x")
   "hdf" #'(counsel-describe-function :which-key "Describe function")
   "hdv" #'(counsel-describe-variable :which-key "Describe variable")
   "ji"  #'(counsel-imenu :which-key "Jump in buffer")
   "bb"  #'(counsel-ibuffer :which-key "List buffers")
   "ry"  #'(counsel-yank-pop :which-key "Kill ring")
   "ic"  #'(ivy-immediate-done :which-key "Immidiate-done")
   ))

;;----------------------------------------------------------------------------
;; Setup projectile
;;----------------------------------------------------------------------------
(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode +1)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "oo" #'projectile--find-file))

(defun roosta/org-find-files ()
  "Quickly search in org folder."
  (interactive)
  (let ((default-directory "~/org"))
    (projectile-find-file)))

(general-def '(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
  "oi" #'roosta/org-find-files)


(provide 'init-ivy)
;;; init-ivy.el ends here
