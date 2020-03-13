;;; init-python.el --- Setup python environment      -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Daniel Berg

;; Author: Daniel Berg <mail@roosta.sh>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(use-package python-mode
  :ensure nil
  :after flycheck
  :mode "\\.py\\'"
  :custom
  (python-indent-offset 4)
  (flycheck-python-pycompile-executable "python3")
  (python-shell-interpreter "python3")
  :general
  ('(normal visual evilified) python-mode-map :prefix ","
   "'"  'python-start-or-switch-repl
   "cc" 'spacemacs/python-execute-file
   "cC" 'spacemacs/python-execute-file-focus
   ;; "db" 'spacemacs/python-toggle-breakpoint
   ;; "ri" 'spacemacs/python-remove-unused-imports
   "sB" 'python-shell-send-buffer-switch
   "sb" 'python-shell-send-buffer
   "sF" 'python-shell-send-defun-switch
   "sf" 'python-shell-send-defun
   "si" 'python-start-or-switch-repl
   "sR" 'python-shell-send-region-switch
   "sr" 'python-shell-send-region
   )
  :config

  (which-key-add-major-mode-key-based-replacements 'python-mode
    ", c" "execute"
    ", d" "debug"
    ", h" "help"
    ", g" "goto"
    ", s" "send to REPL"
    ", r" "refactor"
    ", v" "pyenv"
    ", mV" "pyvenv")

  (defun spacemacs/python-execute-file (arg)
    "Execute a python script in a shell."
    (interactive "P")
    ;; set compile command to buffer-file-name
    ;; universal argument put compile buffer in comint mode
    (let ((universal-argument t)
          (compile-command (format "python %s" (file-name-nondirectory
                                                buffer-file-name))))
      (if arg
          (call-interactively 'compile)
        (compile compile-command t)
        (with-current-buffer (get-buffer "*compilation*")
          (inferior-python-mode)))))

  (defun spacemacs/python-execute-file-focus (arg)
    "Execute a python script in a shell and switch to the shell buffer in
`insert state'."
    (interactive "P")
    (spacemacs/python-execute-file arg)
    (switch-to-buffer-other-window "*compilation*")
    (end-of-buffer)
    (evil-insert-state))

  (defun python-shell-send-buffer-switch ()
    "Send buffer content to shell and switch to it in insert mode."
    (interactive)
    (python-shell-send-buffer)
    (python-shell-switch-to-shell)
    (evil-insert-state))

  (defun python-shell-send-defun-switch ()
    "Send function content to shell and switch to it in insert mode."
    (interactive)
    (python-shell-send-defun nil)
    (python-shell-switch-to-shell)
    (evil-insert-state))

  (defun python-shell-send-region-switch (start end)
    "Send region content to shell and switch to it in insert mode."
    (interactive "r")
    (python-shell-send-region start end)
    (python-shell-switch-to-shell)
    (evil-insert-state))

  (defun python-start-or-switch-repl ()
    "Start and/or switch to the REPL."
    (interactive)
    (let ((shell-process
           (or (python-shell-get-process)
               ;; `run-python' has different return values and different
               ;; errors in different emacs versions. In 24.4, it throws an
               ;; error when the process didn't start, but in 25.1 it
               ;; doesn't throw an error, so we demote errors here and
               ;; check the process later
               (with-demoted-errors "Error: %S"
                 ;; in Emacs 24.5 and 24.4, `run-python' doesn't return the
                 ;; shell process
                 (call-interactively #'run-python)
                 (python-shell-get-process)))))
      (unless shell-process
        (error "Failed to start python shell properly"))
      (pop-to-buffer (process-buffer shell-process))
      (evil-insert-state)))
  )

(use-package lsp-python-ms
  :after lsp-mode python
  :if *python*
  :custom
  (lsp-python-executable-cmd "python3"))


(provide 'init-python)
;;; init-python.el ends here
