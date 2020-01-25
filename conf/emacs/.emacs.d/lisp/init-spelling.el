;;; init-spelling.el --- Spell checking              -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'init-utils)

(use-package flyspell
  :diminish flyspell-mode
  :init
  ;; printing messages for every word (when checking the entire
  ;; buffer) causes an enormous slowdown
  (setq flyspell-issue-message-flag nil)

  (add-hook 'prog-mode-hook #'flyspell-prog-mode)                ; Check comments and strings
  (add-hook 'git-commit-setup-hook 'git-commit-turn-on-flyspell) ; enable spell checking in git commit message

  ;; Don't spell check strings, only comments
  (setq flyspell-prog-text-faces
        (delq 'font-lock-string-face
              flyspell-prog-text-faces))


  :commands
  (spell-checking/change-dictionary)
  :hook
  ((text-mode org-mode markdown-mode) . turn-on-flyspell)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "Sc" 'flyspell-correct-at-point
   "SC" 'roosta/flyspell-save-word
   "Sb" 'flyspell-buffer
   "Sp" 'spell-checking/change-dictionary
   "Sn" 'flyspell-goto-next-error)
  :config
  (defun roosta/flyspell-save-word ()
    (interactive)
    (let ((current-location (point))
          (word (flyspell-get-word)))
      (when (consp word)
        (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))
  )

(use-package define-word
  :commands
  (define-word-at-point
   define-word)
  :general
  ('(normal visual insert emacs)  :prefix "SPC" :non-normal-prefix "C-SPC"
   "Sd" #'define-word-at-point
   "SD" #'define-word))

;; (defun text-mode-hook-setup ()
;;   "Setup spelling completion using company for `text-mode'."

;;   ;; make `company-backends' local is critcal
;;   ;; or else, you will have completion in every major mode, that's very annoying!
;;   (make-local-variable 'company-backends)

;;   ;; company-ispell is the plugin to complete words
;;   (add-to-list 'company-backends 'company-ispell)
;;   )

;; (add-hook 'text-mode-hook #'text-mode-hook-setup)

(provide 'init-spelling)

;;; init-spelling.el ends here
