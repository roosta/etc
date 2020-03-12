;;; init-package.el --- Setup various ways to get remote packages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

;; Install directory {{{
;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(let ((versioned-package-dir
        (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                          user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))
;; }}}
;; Melpa quick start {{{
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
;;}}}
;; TLS bugfix {{{
;; Work-around for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(when (version= "26.2" emacs-version)
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
;;}}}
;; use-package {{{
;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))
;;}}}
;; Quelpa {{{
;; (use-package quelpa)
;; (use-package quelpa-use-package)
;;}}}
;; el-get {{{
(use-package el-get)
;;}}}

(provide 'init-package)
;;; init-package.el ends here
