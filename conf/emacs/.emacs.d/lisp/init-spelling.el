;;; init-spelling.el --- Spell checking              -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package flyspell
  :diminish flyspell-mode
  :defines
  (flyspell-correct-interface)
  :init
  ;; printing messages for every word (when checking the entire
  ;; buffer) causes an enormous slowdown
  (setq flyspell-issue-message-flag nil)

  ;; Don't spell check strings, only comments
  ;; (setq flyspell-prog-text-faces
  ;;       (delq 'font-lock-string-face
  ;;             flyspell-prog-text-faces))

  ;; (add-hook 'prog-mode-hook #'flyspell-prog-mode) ; Check comments and strings

  (add-hook #'git-commit-setup-hook #'git-commit-turn-on-flyspell)
  :commands
  (spell-checking/change-dictionary)
  :hook
  ((text-mode org-mode markdown-mode) . turn-on-flyspell)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "Sb" #'flyspell-buffer
   "Sp" #'spell-checking/change-dictionary
   "Sn" #'flyspell-goto-next-error))

(use-package flyspell-correct
  :commands
  (flyspell-correct-word-generic
   flyspell-correct-previous-word-generic)
  :general
  ('(normal visual insert emacs)  :prefix "SPC" :non-normal-prefix "C-SPC"
   "Sc" #'flyspell-correct-word-generic))

(use-package flyspell-correct-ivy
  :commands (flyspell-correct-ivy
             flyspell-correct-wrapper)
  :general
  ('(normal visual insert emacs)  :prefix "SPC" :non-normal-prefix "C-SPC"
   "SC" #'flyspell-correct-word-generic)
  (flyspell-mode-map
   "C-;" #'flyspell-correct-wrapper)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))

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
