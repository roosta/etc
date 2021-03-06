;;; init-org.el --- Org-mode configuration           -*- lexical-binding: t; -*-

;;; Commentary:
;;; Heavily inspired by Spacemacs
;;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bemacs/org

;;; Code:

(require 'init-utils)
(require 'org)
(require 'org-capture)
(require 'org-tempo)

; Manual
;; (use-package org
;;   :ensure t
;;   ;; ignore org-mode from upstream and use a manually installed version
;;   :pin manual)

;;----------------------------------------------------------------------------
;; Emphasize macro
;; Source: https://github.com/syl20bnr/spacemacs/blob/8c0b8c3440a33df2c291088c47e75fd5e4fbbb61/layers/%2Bemacs/org/packages.el#L142
;;----------------------------------------------------------------------------
(defmacro roosta/org-emphasize (fname char)
  "Make function for setting the emphasis in org mode.
Pass FNAME as the function name and CHAR as the character."
        `(defun ,fname () (interactive)
                (org-emphasize ,char)))

;;----------------------------------------------------------------------------
;; Preferences
;;----------------------------------------------------------------------------
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
 org-duration-format 'h:mm

 ;; Refile to more headings, not just top level
 org-refile-targets '((nil :maxlevel . 9))
 )

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

;;----------------------------------------------------------------------------
;; Evil org
;;----------------------------------------------------------------------------
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

;;----------------------------------------------------------------------------
;; Clock
;;----------------------------------------------------------------------------
(use-package org-clock-csv)

;;----------------------------------------------------------------------------
;; org-projectile
;;----------------------------------------------------------------------------

(defun org-projectile/capture (&optional arg)
  "Capture to project TODOs.
Change behaviour based on optional ARG."
  (interactive "P")
  (if arg
      (org-projectile-project-todo-completing-read nil :empty-lines 1)
    (org-projectile-capture-for-current-project nil :empty-lines 1)))

(defun org-projectile/goto-todos ()
  "Go to project TODOs file."
  (interactive)
  (org-projectile-goto-location-for-project (projectile-project-name)))

(use-package org-projectile
  ;; :diminish projectile-mode
  :config
  (org-projectile-per-project)
  (setq org-projectile-per-project-filepath "TODOs.org")
  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "aop" #'org-projectile/capture
   "po" #'org-projectile/goto-todos))

(use-package ox-gfm
  :config
  (eval-after-load "org"
    '(require 'ox-gfm nil t)))

;;----------------------------------------------------------------------------
;; Keybindings
;;----------------------------------------------------------------------------
(general-define-key
 :states  '(normal visual evilified)
 :keymaps '(org-mode-map)
 :prefix  ","
 "'" #'org-edit-special
 "c" #'org-capture
 "d" #'org-deadline
 "D" #'org-insert-drawer
 "ee" #'org-export-dispatch
 "f" #'org-set-effort
 "P" #'org-set-property
 ":" #'org-set-tags

 "a" #'org-agenda
 "b" #'org-tree-to-indirect-buffer
 "A" #'org-archive-subtree
 "l" #'org-open-at-point
 "T" #'org-show-todo-tree

 "." #'org-time-stamp
 "!" #'org-time-stamp-inactive

 ;; headings
 "hi" #'org-insert-heading-after-current
 "hI" #'org-insert-heading
 "hs" #'org-insert-subheading

 ;; More cycling options (timestamps, headlines, items, properties)
 "L" #'org-shiftright
 "H" #'org-shiftleft
 "J" #'org-shiftdown
 "K" #'org-shiftup

 ;; Change between TODO sets
 "C-S-l" #'org-shiftcontrolright
 "C-S-h" #'org-shiftcontrolleft
 "C-S-j" #'org-shiftcontroldown
 "C-S-k" #'org-shiftcontrolup

 ;; Subtree editing
 "Sl" #'org-demote-subtree
 "Sh" #'org-promote-subtree
 "Sj" #'org-move-subtree-down
 "Sk" #'org-move-subtree-up

 ;; tables
 "ta" #'org-table-align
 "tb" #'org-table-blank-field
 "tc" #'org-table-convert
 "tdc" #'org-table-delete-column
 "tdr" #'org-table-kill-row
 "te" #'org-table-eval-formula
 "tE" #'org-table-export
 "th" #'org-table-previous-field
 "tH" #'org-table-move-column-left
 "tic" #'org-table-insert-column
 "tih" #'org-table-insert-hline
 "tiH" #'org-table-hline-and-move
 "tir" #'org-table-insert-row
 "tI" #'org-table-import
 "tj" #'org-table-next-row
 "tJ" #'org-table-move-row-down
 "tK" #'org-table-move-row-up
 "tl" #'org-table-next-field
 "tL" #'org-table-move-column-right
 "tn" #'org-table-create
 "tN" #'org-table-create-with-table.el
 "tr" #'org-table-recalculate
 "ts" #'org-table-sort-lines
 "ttf" #'org-table-toggle-formula-debugger
 "tto" #'org-table-toggle-coordinate-overlays
 "tw" #'org-table-wrap-region

 ;; Multi-purpose keys
 "," #'org-ctrl-c-ctrl-c
 "*" #'org-ctrl-c-star
 "RET" #'org-ctrl-c-ret
 "-" #'org-ctrl-c-minus
 "^" #'org-sort
 "/" #'org-sparse-tree

 "I" #'org-clock-in
 "n" #'org-narrow-to-subtree
 "N" #'widen
 "O" #'org-clock-out
 "q" #'org-clock-cancel
 "R" #'org-refile
 "s" #'org-schedule

 ;; insertion of common elements
 "ia" #'org-attach
 "il" #'org-insert-link
 "if" #'org-footnote-new

 ;; region manipulation
 "xb" (roosta/org-emphasize roosta/org-bold ?*)
 "xc" (roosta/org-emphasize roosta/org-code ?~)
 "xi" (roosta/org-emphasize roosta/org-italic ?/)
 "xr" (roosta/org-emphasize roosta/org-clear ? )
 "xs" (roosta/org-emphasize roosta/org-strike-through ?+)
 "xu" (roosta/org-emphasize roosta/org-underline ?_)
 "xv" (roosta/org-emphasize roosta/org-verbose ?=)
 )

(after-load 'org-capture
  (general-define-key
   :states  '(normal visual evilified)
   :keymaps '(org-capture-mode-map)
   :prefix  ","
   "c" #'org-capture-finalize
   "k" #'org-capture-kill
   "a" #'org-capture-kill
   "r" #'org-capture-refile
   ))

(after-load 'org-src
  (general-define-key
   :states  '(normal visual evilified)
   :keymaps '(org-src-mode-map)
   :prefix  ","
   "c" #'org-edit-src-exit
   "a" #'org-edit-src-abort
   "k" #'org-edit-src-abort))

(which-key-add-major-mode-key-based-replacements 'org-mode
  ", e" "export"
  ", x" "text"
  ", h" "headings"
  ", i" "insert"
  ", S" "subtrees"
  ", t" "tables"
  ", td" "delete"
  ", ti" "insert"
  ", tt" "toggle")

(general-unbind '(normal visual operator) org-mode-map
  "C-j"
  "C-k")

(general-def 'insert org-mode-map
  "M-l" #'outline-demote
  "M-h" 'outline-promote)

(general-def 'normal org-mode-map
  "TAB" 'org-cycle)

(provide 'init-org)
;;; init-org.el ends here
