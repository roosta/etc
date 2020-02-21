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

  (add-hook 'git-commit-setup-hook 'git-commit-turn-on-flyspell) ; enable spell checking in git commit message
  :commands
  (spell-checking/change-dictionary)
  :hook
  ((text-mode org-mode markdown-mode) . turn-on-flyspell)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   ;; "Sc" 'flyspell-correct-at-point
   "SC" 'roosta/flyspell-save-word
   "Sb" 'flyspell-buffer
   "Sp" 'spell-checking/change-dictionary
   "Sn" 'flyspell-goto-next-error
   "Sa" 'flyspell-auto-correct-previous-word)
  ('(normal visual insert emacs)
   "<f12>" 'flyspell-auto-correct-previous-word)
  :config
  (defun roosta/flyspell-save-word ()
    "Save a word to personal dictionary"
    (interactive)
    (y-or-n-p "Save word to dictionary? ")
    (let ((current-location (point))
          (word (flyspell-get-word)))
      (when (consp word)
        (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location)))))


(use-package flyspell-correct
  :commands
  (flyspell-correct-next
   flyspell-correct-previous
   flyspell-correct-at-point)
  :general
  ('(normal visual insert emacs)  :prefix "SPC" :non-normal-prefix "C-SPC"
   "Sc" #'flyspell-correct-wrapper)
  (flyspell-mode-map
   "C-;" #'flyspell-correct-wrapper))

(use-package flyspell-correct-ivy
  :commands (flyspell-correct-ivy
             flyspell-correct-wrapper)
  :custom
  (flyspell-correct-interface #'flyspell-correct-ivy))

(use-package define-word
  :commands
  (define-word-at-point
   define-word)
  :general
  ('(normal visual insert emacs)  :prefix "SPC" :non-normal-prefix "C-SPC"
   "Sd" #'define-word-at-point
   "SD" #'define-word))

(provide 'init-spelling)

;;; init-spelling.el ends here
