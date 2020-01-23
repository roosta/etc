;;; init-shell-scripting.el --- Setup shell scripting (bash, zsh, sh etc)  -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(use-package insert-shebang
  :init
  (remove-hook 'find-file-hook 'insert-shebang)
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "i!"  #'roosta/insert-shebang)
  :config
  (defun roosta/insert-shebang ()
    (interactive)
    (insert-shebang-get-extension-and-insert
     (file-name-nondirectory (buffer-file-name)))))

;;----------------------------------------------------------------------------
;; keybindings
;;----------------------------------------------------------------------------
(general-define-key
  :states  '(normal visual evilified)
  :keymaps '(sh-mode-map)
  :prefix  ","
  "gg"  #'dumb-jump-go)

(which-key-add-major-mode-key-based-replacements 'sh-mode
  ", g" "goto")

(provide 'init-shell-scripting)
;;; init-shell-scripting.el ends here
