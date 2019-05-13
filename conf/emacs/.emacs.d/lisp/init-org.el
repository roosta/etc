;;; init-org.el --- Org-mode configuration           -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(require 'init-utils)

(defvar org-export-with-drawers)
(defvar org-clock-persist)
(defvar org-hide-emphasis-markers)
(defvar org-log-into-drawer)
(defvar org-src-tab-acts-natively)
(defvar org-clock-idle-time)
(defvar org-mobile-directory)
(defvar org-mobile-files)
(defvar org-agenda-files)
(defvar org-capture-templates)
(defvar org-duration-format)

(setq
 ;; I added this to export clock times in drawers
 org-export-with-drawers t

 ;; Save the running clock when emacs is closed
 org-clock-persist 't

 ;; hide markers like ~this~ and =this=
 ;; makes for a better reading experience I think
 org-hide-emphasis-markers t

 org-log-into-drawer "LOGBOOK"

 ;; have indending in source blocks make a bit more sense
 org-src-tab-acts-natively t

 org-clock-idle-time 30

 ;; use dropbox to sync mobile changes
 org-mobile-directory "~/Dropbox/MobileOrg"

 ;; define which files are available for mobile-org
 org-mobile-files (quote ("~/org/media.org"
                          "~/org/TODOs.org"
                          "~/org/buy.org"
                          "~/org/shopping.org"
                          "~/org/scratch.org"
                          "~/org/loans.org"))

 ;; define agenda files
 org-agenda-files (quote ("~/org/TODOs.org" "~/org/projects.org" "~/org/work.org"))

 ;; Capture templates
 ;; http://orgmode.org/manual/Capture-templates.html#Capture-templates
 org-capture-templates
 '(("t" "Todo" entry (file "~/org/TODOs.org")
    "* TODO %?"))

 ;; dont show hours in days in clocktable
 org-duration-format 'h:mm)

  ;; persist clock on emacs restart
  (org-clock-persistence-insinuate)

(use-package org-bullets
  :load-path "~/src/org-bullets"
  :demand t
  :commands
  (org-bullets-mode)
  :init
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package evil-org
  :after org
  :general
  (evil-org-mode-map
   "<C-return>" 'evil-org-org-insert-heading-respect-content-below)
  :commands
  (evil-org-set-key-theme
   evil-org-agenda-set-keys)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(provide 'init-org)
;;; init-org.el ends here
