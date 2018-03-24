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
 yas-snippet-dirs '("~/.spacemacs.d/snippets")

 ;; set default browser, wouldn't use xdk default browser
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "firefox"

 hl-paren-colors '("#FCE8C3" ; bright-white
                   "#519F50" ; green
                   "#2C78BF" ; blue
                   "#918175" ; white
                   )
 )

;; Navigating using visual lines, line break counts as new line when navigating
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; These changed in some commit
(define-key global-map (kbd "C-k") 'evil-window-up)
(define-key global-map (kbd "C-j") 'evil-window-down)
(define-key global-map (kbd "C-l") 'evil-window-right)
(define-key global-map (kbd "C-h") 'evil-window-left)

(spaceline-toggle-hud-off)

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

;; Change previous tab to this function, it hopefully preserves layout
(spacemacs/set-leader-keys "TAB" 'mode-line-other-buffer)

;; cause seriously, now many times have I checked some output after assuming the
;; file has been saved and then been perplexed about why my changes aren't
;; reflected
(with-eval-after-load 'evil-maps
  (evil-ex-define-cmd "W" 'evil-write))

;; ----------------------------------------------------
;; clojure
;; ----------------------------------------------------
(require 'cider)

;; (evil-define-key 'normal clojurescript-mode-map ";" 'cider-eval-sexp-at-point)
;; (evil-define-key 'normal clojure-mode-map ";" 'cider-eval-sexp-at-point)

(setq

 ;; start cljs repl scripts/repl.clj in project
 ;; cider-cljs-lein-repl "(require 'repl)"

 ;; include local-dev as a profile
 ;; cider-lein-parameters "with-profile +local-dev repl :headless :host ::"

 clojure-enable-fancify-symbols nil

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
;; (eval-after-load 'clojure-mode
;;   '(sayid-setup-package))

(add-hook 'cider-repl-mode-hook #'evil-cleverparens-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'turn-on-smartparens-strict-mode)

(add-hook 'clojure-mode-hook #'turn-on-smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'turn-on-smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

;; The following customization of the cider-repl-mode-map will change these
;; keybindings so that Return will introduce a new-line and C- will send the
;; form off for evaluation.
(define-key cider-repl-mode-map (kbd "RET") #'cider-repl-newline-and-indent)
(define-key cider-repl-mode-map (kbd "C-<return>") #'cider-repl-return)

(evil-define-key 'normal cider-repl-mode-map
  (kbd "C-k") 'evil-window-up
  (kbd "C-j") 'evil-window-down
  (kbd "C-h") 'evil-window-left
  (kbd "C-l") 'evil-window-right)

(require 're-jump)

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
;; lisp
;; ----------------------------------------------------
(setq
 evil-cleverparens-use-additional-movement-keys t
 evil-cleverparens-use-s-and-S nil
 evil-cleverparens-swap-move-by-word-and-symbol nil)

(require 'evil-cleverparens-text-objects)
;; (dolist (map (list evil-insert-state-map))
;;   (define-key map "\M-l" 'sp-slurp-hybrid-sexp)
;;   (define-key map "\M-h" 'sp-forward-barf-sexp)
;;   (define-key map "\M-L" 'sp-backward-slurp-sexp)
;;   (define-key map "\M-H" 'sp-backward-barf-sexp))

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

  (require 'org-extras)

  (define-key spacemacs-org-mode-map-prefix (kbd ">") 'org-link-edit-forward-slurp)
  (define-key spacemacs-org-mode-map-prefix (kbd "<") 'org-link-edit-forward-barf)

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
  (kbd "C-l") 'evil-window-left
  (kbd "C-h") 'evil-window-right
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

;; --------------------------------------------------
;; evil-snipe
;; --------------------------------------------------
(with-eval-after-load 'evil-snipe
  (push '(?\[ "[[{(]") evil-snipe-aliases)
  (push '(?\] "[]})]") evil-snipe-aliases))

;; --------------------------------------------------
;; Helm
;; --------------------------------------------------
(define-key helm-map (kbd "ESC") 'helm-keyboard-quit)

;; Prevent "display not ready" issue when opening helm in succession
;; https://github.com/emacs-helm/helm/issues/550
(setq helm-exit-idle-delay 0)
