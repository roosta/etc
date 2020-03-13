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


(use-package ein
  :general
  ('(normal visual evilified) ein:notebook-multilang-mode-map :prefix ","
   "y" 'ein:worksheet-copy-cell
   "p" 'ein:worksheet-yank-cell
   "d" 'ein:worksheet-kill-cell
   "h" 'ein:notebook-worksheet-open-prev-or-last
   "i" 'ein:worksheet-insert-cell-below
   "I" 'ein:worksheet-insert-cell-above
   "j" 'ein:worksheet-goto-next-input
   "k" 'ein:worksheet-goto-prev-input
   "l" 'ein:notebook-worksheet-open-next-or-first
   "H" 'ein:notebook-worksheet-move-prev
   "J" 'ein:worksheet-move-cell-down
   "K" 'ein:worksheet-move-cell-up
   "L" 'ein:notebook-worksheet-move-next
   "t" 'ein:worksheet-toggle-output
   "R" 'ein:worksheet-rename-sheet
   "RET" 'ein:worksheet-execute-cell-and-goto-next
   ;; Output
   " C-l" 'ein:worksheet-clear-output
   " C-S-l" 'ein:worksheet-clear-all-output
   ;;Console
   " C-o" 'ein:console-open
   ;; Merge cells
   " C-k" 'ein:worksheet-merge-cell
   " C-j" 'spacemacs/ein:worksheet-merge-cell-next
   ;; Notebook
   " C-s" 'ein:notebook-save-notebook-command
   " C-r" 'ein:notebook-rename-command
   "1" 'ein:notebook-worksheet-open-1th
   "2" 'ein:notebook-worksheet-open-2th
   "3" 'ein:notebook-worksheet-open-3th
   "4" 'ein:notebook-worksheet-open-4th
   "5" 'ein:notebook-worksheet-open-5th
   "6" 'ein:notebook-worksheet-open-6th
   "7" 'ein:notebook-worksheet-open-7th
   "8" 'ein:notebook-worksheet-open-8th
   "9" 'ein:notebook-worksheet-open-last
   "+" 'ein:notebook-worksheet-insert-next
   "-" 'ein:notebook-worksheet-delete
   "x" 'ein:notebook-close
   "u" 'ein:worksheet-change-cell-type
   "fs" 'ein:notebook-save-notebook-command)
  ('(normal visual evilified) ein:traceback-mode-map :prefix ","
   "RET" 'ein:tb-jump-to-source-at-point-command
   "n" 'ein:tb-next-item
   "p" 'ein:tb-prev-item
   "q" 'bury-buffer)
  ('(normal insert) ein:notebook-multilang-mode-map
   "<C-return>" 'ein:worksheet-execute-cell
   "<S-return"  'ein:worksheet-execute-cell-and-goto-next)
  ('(normal) ein:notebook-multilang-mode-map
   "gj" 'ein:worksheet-goto-next-input
   "gk" 'ein:worksheet-goto-prev-input)
  ('(normal insert visual) ein:notebook-multilang-mode-map
   "M-j" 'ein:worksheet-move-cell-down
   "M-k" 'ein:worksheet-move-cell-up)
  :config
  )

(provide 'init-python)
;;; init-python.el ends here
