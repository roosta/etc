;;; init-backup.el --- Setup emacs file backup       -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; https://www.emacswiki.org/emacs/BackupDirectory
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/var/emacs/backup/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


(provide 'init-backup)
;;; init-backup.el ends here
