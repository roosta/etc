;;; init-spelling.el --- Spell checking              -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:



(provide 'init-spelling)

(defvar flyspell-correct-interface)

(use-package flyspell
  :commands
  (spell-checking/change-dictionary)
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

;;; init-spelling.el ends here
