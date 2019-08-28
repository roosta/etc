;;; init-shell-scripting.el --- Setup shell scripting (bash, zsh, sh etc)  -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:


;;----------------------------------------------------------------------------
;; Insert shebang
;;----------------------------------------------------------------------------
(use-package insert-shebang
  :init
  (remove-hook 'find-file-hook 'insert-shebang)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "i!"  #'spacemacs/insert-shebang))

(defun spacemacs/insert-shebang ()
  "Insert shebang line at the top of the file."
  (interactive)
  (require 'insert-shebang)
  (insert-shebang-get-extension-and-insert
   (file-name-nondirectory (buffer-file-name))))


;;----------------------------------------------------------------------------
;; keybindings
;;----------------------------------------------------------------------------
(general-define-key
  :states  '(normal visual evilified)
  :keymaps '(shell-mode-map)
  :prefix  ","
  "gg"  #'dumb-jump-go)

(provide 'init-shell-scripting)
;;; init-shell-scripting.el ends here
