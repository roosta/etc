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
(eval-when-compile
  (require 'init-flycheck)
  (require 'init-const)
  (require 'init-utils))

(which-key-add-major-mode-key-based-replacements 'python-mode
  ", c" "execute"
  ", d" "debug"
  ", h" "help"
  ", g" "goto"
  ", s" "send to REPL"
  ", r" "refactor"
  ", v" "pyenv"
  ", mV" "pyvenv")

(setq python-indent-offset 4)
(setq python-shell--interpreter-args "-i")
(setq python-shell--interpreter "python")

(ensure-lib-from-url
 'python-utils
 "https://raw.githubusercontent.com/syl20bnr/spacemacs/develop/layers/%2Blang/python/funcs.el")

(load-file (site-lisp-library-el-path 'python-utils))

(general-def '(normal visual evilified) python-mode-map :prefix ","
  "'"  'python-start-or-switch-repl
  "cc" 'spacemacs/python-execute-file
  "cC" 'spacemacs/python-execute-file-focus
  ;; "db" 'spacemacs/python-toggle-breakpoint
  ;; "ri" 'spacemacs/python-remove-unused-imports
  "sB" 'spacemacs/python-shell-send-buffer-switch
  "sb" 'spacemacs/python-shell-send-buffer
  "sF" 'spacemacs/python-shell-send-defun-switch
  "sf" 'spacemacs/python-shell-send-defun
  "si" 'spacemacs/python-start-or-switch-repl
  "sR" 'spacemacs/python-shell-send-region-switch
  "sr" 'spacemacs/python-shell-send-region)

(use-package lsp-python-ms
  :after lsp-mode python
  :if *python*)

(use-package ein
  :general
  ('(normal visual evilified) ein:notebook :definer 'minor-mode :prefix ","
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
   "C-l" 'ein:worksheet-clear-output
   "C-S-l" 'ein:worksheet-clear-all-output
   ;;Console
   "C-o" 'ein:console-open
   ;; Merge cells
   "C-k" 'ein:worksheet-merge-cell
   "C-j" 'spacemacs/ein:worksheet-merge-cell-next
   "s" 'ein:worksheet-split-cell-at-point
   ;; Notebook
   "C-s" 'ein:notebook-save-notebook-command
   "C-r" 'ein:notebook-rename-command
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
  ('(normal visual evilified) ein:traceback-mode :prefix ","
   "RET" 'ein:tb-jump-to-source-at-point-command
   "n" 'ein:tb-next-item
   "p" 'ein:tb-prev-item
   "q" 'bury-buffer)
  ('(normal insert) ein:notebook :definer 'minor-mode
   "<C-return>" 'ein:worksheet-execute-cell
   "<S-return"  'ein:worksheet-execute-cell-and-goto-next)
  ('(normal) ein:notebook :definer 'minor-mode
   "gj" 'ein:worksheet-goto-next-input
   "gk" 'ein:worksheet-goto-prev-input)
  ('(normal insert visual) ein:notebook :definer 'minor-mode
   "M-j" 'ein:worksheet-move-cell-down
   "M-k" 'ein:worksheet-move-cell-up)
  :config
  (defun spacemacs/ein:worksheet-merge-cell-next ()
    (interactive)
    (ein:worksheet-merge-cell (ein:worksheet--get-ws-or-error) (ein:worksheet-get-current-cell) t t)))

(provide 'init-python)
;;; init-python.el ends here
