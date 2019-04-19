;;; init-exec-path.el --- Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-
;;; Source: https://github.com/purcell/emacs.d/blob/master/lisp/init-exec-path.el
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package exec-path-from-shell
             :ensure t
             :config
             (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
               (add-to-list 'exec-path-from-shell-variables var)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
