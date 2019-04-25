;;; init-uniquify.el --- Configure uniquification of buffer names -*- lexical-binding: t -*-
;;; Source: https://github.com/bbatsov/prelude, http://pragmaticemacs.com/emacs/uniquify-your-buffer-names/
;;; Commentary:

;;; Code:

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(provide 'init-uniquify)
;;; init-uniquify.el ends here
