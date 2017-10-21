;; ┓━┓┳━┓┳━┓┏━┓┳━┓┏┏┓┳━┓┏━┓┓━┓  ┳ ┓┓━┓┳━┓┳━┓  ┏━┓┏━┓┏┓┓┳━┓o┏━┓
;; ┗━┓┃━┛┃━┫┃  ┣━ ┃┃┃┃━┫┃  ┗━┓  ┃ ┃┗━┓┣━ ┃┳┛  ┃  ┃ ┃┃┃┃┣━ ┃┃ ┳
;; ━━┛┇  ┛ ┇┗━┛┻━┛┛ ┇┛ ┇┗━┛━━┛  ┇━┛━━┛┻━┛┇┗┛  ┗━┛┛━┛┇┗┛┇  ┇┇━┛
;; -----------------------------------------------------------
;; Misc
;; -----------------------------------------------------------
(setq

 scroll-margin 7

 ;; Used to vim regexp
 evil-ex-search-vim-style-regexp t

 ;; don't use powerline separators in statusbar
 powerline-default-separator 'nil
 ;; spaceline-separator-dir-left '(left . left)
 ;; spaceline-separator-dir-right '(right . right)

 ;; always follow symlinks
 vc-follow-symlinks t

 ;; move across linebreaks
 evil-move-beyond-eol t

 ;; define a custom snippets location
 yas-snippet-dirs
 '("~/.spacemacs.d/snippets")

 ;; set default browser, wouldn't use xdk default browser
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "firefox"
 )

;; temporary fix for kill-ring pop. See https://github.com/syl20bnr/spacemacs/issues/8823
;; (define-key evil-normal-state-map (kbd "p") 'evil-paste-after)
;; (define-key evil-normal-state-map (kbd "P") 'evil-paste-before)

(defun roosta/find-user-config ()
  (interactive)
  (find-file-existing "~/.spacemacs.d/user-config.el"))


;; (defun roosta/org-search ()
;;   (interactive)
;;   (let ((default-directory "/home/roosta/org"))
;;     (spacemacs/helm-project-smart-do-search)))

;; (spacemacs/set-leader-keys "ot" 'roosta/org-search)

(spacemacs/set-leader-keys "feu" 'roosta/find-user-config)

;; opening project files
(spacemacs/set-leader-keys "o" 'helm-projectile-find-file)


;; -----------------------------------------------------------
;; Cider
;; -----------------------------------------------------------
(require 'cider)
;; use figwheel when starting a cljs repl
(setq

 ;; start cljs repl scripts/repl.clj in project
 cider-cljs-lein-repl "(require 'repl)"

 ;; include local-dev as a profile
 ;; cider-lein-parameters "with-profile +local-dev repl :headless :host ::"

 ;; cider-pprint-fn "puget"
 clojure-enable-fancify-symbols t

 ;; use app lifecycle functions in cider-refresh
 cider-refresh-before-fn "user/stop"
 cider-refresh-after-fn "user/go"

 ;; always pretty print in repl
 cider-repl-use-pretty-printing t

 ;; possible fix for unhighlighted reader conditionals eg. #?(:cljs)
 ;; cider-font-lock-reader-conditionals nil

 ;; Add to list to highlight more than macro and core
 ;; cider-font-lock-dynamically '(macro core function var)

 ;; add syntax highlighting to eval overlay
 cider-overlays-use-font-lock t
 )

;; load sayid keybindings for clojure-mode buffers
(eval-after-load 'clojure-mode
  '(sayid-setup-package))

(add-hook 'cider-repl-mode-hook #'evil-cleverparens-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)

;; ----------------------------------------------------
;; flycheck
;; ----------------------------------------------------
;; (eval-after-load 'flycheck '(flycheck-clojure-setup))
;; (add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-joker)
(add-to-list 'flycheck-global-modes 'clojure-mode)
(add-to-list 'flycheck-global-modes 'clojurescript-mode)

(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;; ----------------------------------------------------
;; smartparens
;; ----------------------------------------------------
;; Some keybinds conflict with evil bindings, and I prefer the evil ones
(setq
 evil-cleverparens-use-additional-movement-keys nil)

;; ----------------------------------------------------
;; clojure
;; ----------------------------------------------------
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

;; Navigating using visual lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; ----------------------------------------------------
;; evil-surround
;; ----------------------------------------------------
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)

;; (evil-define-key 'normal evil-surround-mode-map (kbd "<cs>") 'evil-surround-change)
;; (evil-define-key 'normal evil-surround-mode-map (kbd "<ds>") 'evil-surround-delete)

;; terminal-only conf
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate) ; or (etcc-on)
  (setq
   ;; add a space between text and line numbers
   linum-relative-format "%3s "))

;; Mutt support.
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

;; ----------------------------------------------------
;; org
;; ----------------------------------------------------
(with-eval-after-load 'org

  (setq
   ;; I added this to export clock times in drawers
   org-export-with-drawers t

   ;; Save the running clock when emacs is closed
   org-clock-persist 't

   ;; hide markers like ~this~ and =this=
   ;; makes for a better reading experience I think
   org-hide-emphasis-markers t

   ;; have indending in source blocks make a bit more sense
   org-src-tab-acts-natively t

   org-clock-idle-time 15

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
   org-agenda-files (quote ("~/org/TODOs.org"))

   ;; Capture templates
   ;; http://orgmode.org/manual/Capture-templates.html#Capture-templates
   org-capture-templates
   '(("t" "Todo" entry (file "~/org/TODOs.org")
      "* TODO %?"))

   ;; dont show hours in days in clocktable
   org-duration-format 'h:mm
   )

  ;; enable spell-checking in org-mode files
  (add-hook 'org-mode-hook #'spacemacs/toggle-spelling-checking-on)

  ;; disabled linum in org since it cause serious slowdown on larger files
  (add-hook 'org-mode-hook #'spacemacs/toggle-line-numbers-off)
  (add-hook 'org-mode-hook #'spacemacs/linum-relative-toggle)

  ;; persist clock on emacs restart
  (org-clock-persistence-insinuate)

  )

;; ----------------------------------------------------
;; markdown
;; ----------------------------------------------------
(add-hook 'markdown-mode-hook #'spacemacs/toggle-spelling-checking-on)

;; ----------------------------------------------------
;; Slack
;; ----------------------------------------------------
(if (file-directory-p "~/Private/slack")
    (progn (load-file "~/Private/slack/sic.el")
           (load-file "~/Private/slack/bitraf.el"))
  (message "~/Private is not mounted, cannot load slack config"))

(add-hook 'slack-mode-hook #'spacemacs/toggle-spelling-checking-on)

;; ----------------------------------------------------
;; Alert
;; ----------------------------------------------------
(setq
 alert-default-style 'libnotify)

;; ----------------------------------------------------
;; Flymd
;; ----------------------------------------------------
(defun my-flymd-browser-function (url)
  (let ((process-environment (browse-url-process-environment)))
    (apply 'start-process
           (concat "google-chrome-unstable " url) nil
           "google-chrome-unstable"
           (list "--allow-file-access-from-files" url "--force-device-scale-factor=1"))))
(setq flymd-browser-open-function 'my-flymd-browser-function)

;; ----------------------------------------------------
;; Github
;; ----------------------------------------------------
(if (file-directory-p "~/Private/github")
    (load-file "~/Private/github/github.el")
    (message "~/Private is not mounted, cannot load github config"))

(add-to-list 'load-path "~/.emacs.d/toc-org")
(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-enable)
  (warn "toc-org not found"))

;; --------------------------------------------------
;; Terminal
;; --------------------------------------------------

;; override term-send-up/down with window changing
;; can still send up and down in insert mode
(evil-define-key 'normal term-raw-map
  (kbd "C-k") 'evil-window-up
  (kbd "C-j") 'evil-window-down
  (kbd "<C-up>") 'term-send-up
  (kbd "<C-down>") 'term-send-down
  (kbd "<C-return>") 'term-send-return)

;; --------------------------------------------------
;; Rust
;; --------------------------------------------------

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
