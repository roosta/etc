;;; init.el --- Load the full configuration -*- lexical-binding: t -*-

;; This file bootstraps the configuration, which is divided into
;; a number of other files. Inspired by https://github.com/purcell/emacs.d

;;; Commentary:
;;; Code:

(defvar exec-path-from-shell-check-startup-files)
(setq
  debug-on-error t ; Produce backtraces when errors occur
  exec-path-from-shell-check-startup-files nil ; disable warning about setting path outside profile/env
  vc-follow-symlinks t ; always follow symlinks
  )

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defvar local-file (expand-file-name (concat "local/" (system-name) ".el") user-emacs-directory))
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
;; (require 'init-exec-path) ;; Set up $PATH


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require 'advice) ;; Remove warning about non-defined functions

(use-package diminish)
(use-package dash)
(use-package s)
(use-package which-key
  :config (which-key-mode)
  :diminish which-key-mode)
(use-package general)

(require 'init-frame-hooks)
(require 'init-term)
(require 'init-gui-frames)
(require 'init-evil)
(require 'init-theme)
(require 'init-ivy)
(require 'init-undo-tree)
(require 'init-uniquify)
(require 'init-git)
(require 'init-org)
(require 'init-editing-utils)
(require 'init-lisp)
(require 'init-backup)
(require 'init-flycheck)
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


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (if (and (fboundp 'server-running-p)
                     (not (server-running-p)))
                (server-start))))



;;----------------------------------------------------------------------------
;; Load host local variables
;;----------------------------------------------------------------------------
(when (file-exists-p local-file)
  (load local-file))


(provide 'init)
;;; init.el ends here
