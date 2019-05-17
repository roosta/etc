;;; init-spelling.el --- Spell checking              -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defvar flyspell-correct-interface)

(use-package flyspell
  :init
  ;; printing messages for every word (when checking the entire
  ;; buffer) causes an enormous slowdown
  (setq flyspell-issue-message-flag nil)
  :commands
  (spell-checking/change-dictionary)
  :config
  (add-hook 'prog-mode-hook #'flyspell-prog-mode)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "Sb" #'flyspell-buffer
   "Sd" #'spell-checking/change-dictionary
   "Sn" #'flyspell-goto-next-error))

(use-package flyspell-correct
  :commands
  (flyspell-correct-word-generic
   flyspell-correct-previous-word-generic)
  :general
  ('(normal visual insert emacs)  :prefix "SPC" :non-normal-prefix "C-SPC"
   "Sc" #'flyspell-correct-previous-word-generic))

(use-package flyspell-correct-ivy
  :commands (flyspell-correct-ivy)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))

(provide 'init-spelling)

;;; init-spelling.el ends here
