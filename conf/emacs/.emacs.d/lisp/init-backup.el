;;; init-backup.el --- Setup emacs file backup       -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; define and create backup directory
(defvar emacs-backup-directory (expand-file-name "var/backup" user-emacs-directory))
(make-directory emacs-backup-directory t)

;; https://www.emacswiki.org/emacs/BackupDirectory
(setq
  backup-by-copying t      ; don't clobber symlinks
  backup-directory-alist
  `(("." . ,emacs-backup-directory))    ; don't litter my fs tree
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t ; use versioned backups
  auto-save-list-file-prefix
  (concat emacs-backup-directory ".auto-saves-")
  auto-save-file-name-transforms
  `((".*" ,emacs-backup-directory t)))


(provide 'init-backup)
;;; init-backup.el ends here
