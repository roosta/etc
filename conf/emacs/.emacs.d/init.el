;;; init.el --- Load the full configuration -*- lexical-binding: t -*-

;; Copyright (C) 2020  Daniel Berg

;; Author: Daniel Berg <mail@roosta.sh>

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

;; This file bootstraps the configuration, which is divided into a
;; number of other files.  Inspired by:
;; https://github.com/purcell/emacs.d
;; https://github.com/MatthewZMD/.emacs.d

;;; Code:

;; load path {{{
;; -------------------------------------
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;}}}
;; Adjust garbage collection thresholds during startup, and thereafter {{{
;; -------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))
;;}}}
;; Bootstrap config {{{
;; -------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defvar local-file (expand-file-name (concat "local/" (system-name) ".el") user-emacs-directory))
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-package)      ;; Machinery for installing required packages
(require 'init-const)
(require 'init-global-config)
;; (require 'init-exec-path) ;; Set up $PATH
;;}}}
;; Variables configured via the interactive 'customize' interface {{{
(when (file-exists-p custom-file)
  (load custom-file))
;;}}}
;; Load configs for specific features and modes {{{
;; -------------------------------------
(use-package diminish)
(use-package dash)
(use-package s)
(use-package which-key
  :config (which-key-mode)
  :diminish which-key-mode)
(use-package general)

(require 'init-frame-hooks)
(require 'init-evil)
(require 'init-term)
(require 'init-gui-frames)
(require 'init-theme)
(require 'init-modeline)
(require 'init-ivy)
(require 'init-undo-tree)
(require 'init-uniquify)
(require 'init-git)
(require 'init-org)
(require 'init-editing-utils)
(require 'init-lisp)
(require 'init-elisp)
(require 'init-backup)
(require 'init-flycheck)
(require 'init-lsp)
(require 'init-company)
(require 'init-prescient)
(require 'init-yasnippet)
(require 'init-clojure)
(require 'init-yaml)
(require 'init-markdown)
(require 'init-spelling)
(require 'init-hl-todo)
(require 'init-folding)
(require 'init-sql)
(require 'init-syntax)
(require 'init-shell-scripting)
(require 'init-dired)
(require 'init-javascript)
(require 'init-windows)
(require 'init-misc)
(require 'init-perspective)
(require 'init-html)
(require 'init-cpp)
(require 'init-rust)
(require 'init-compilation)
(require 'init-csharp)

;; Run el-get sync to fetch all remote packages
(el-get 'sync)
;;}}}
;; Allow access from Emacs client {{{
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (if (and (fboundp 'server-running-p)
                     (not (server-running-p)))
                (server-start))))
;;}}}
;; Load host local variables {{{
(when (file-exists-p local-file)
  (load local-file))
;;}}}

(provide 'init)
;;; init.el ends here
