;;; init-sql.el --- sql integration                  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(defvar sql-postgres-login-params)
(setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "postgres")
        (server :default "localhost")
        (port :default 25060)))

;; prevent lines from being truncated
;; https://truongtx.me/2014/08/23/setup-emacs-as-an-sql-database-client
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(provide 'init-sql)
;;; init-sql.el ends here
