;; ┓━┓┳━┓┳━┓┏━┓┳━┓┏┏┓┳━┓┏━┓┓━┓  ┳ ┓┓━┓┳━┓┳━┓  ┏━┓┏━┓┏┓┓┳━┓o┏━┓
;; ┗━┓┃━┛┃━┫┃  ┣━ ┃┃┃┃━┫┃  ┗━┓  ┃ ┃┗━┓┣━ ┃┳┛  ┃  ┃ ┃┃┃┃┣━ ┃┃ ┳
;; ━━┛┇  ┛ ┇┗━┛┻━┛┛ ┇┛ ┇┗━┛━━┛  ┇━┛━━┛┻━┛┇┗┛  ┗━┛┛━┛┇┗┛┇  ┇┇━┛

;; -----------------------------------------------------------
;; General
;; -----------------------------------------------------------
(setq
 scroll-margin 7

 ;; Used to vim regexp
 evil-ex-search-vim-style-regexp t

 ;; always follow symlinks
 vc-follow-symlinks t

 ;; move normally across linebreaks
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

 undo-tree-auto-save-history t
 undo-tree-history-directory-alist '(("." . "~/var/emacs/undo"))
 tab-width 2
 )

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; That little navigation hint on the right side of the mode-line
;; caused the mode-line to get too big when not using separators
; (spaceline-toggle-hud-off)

(defun roosta/find-user-config ()
  "Jump to my user config"
  (interactive)
  (find-file-existing "~/.spacemacs.d/user-config.el"))

(defun roosta/org-search ()
  "Quickly search in org folder"
  (interactive)
  (spacemacs/helm-files-do-ag "~/org"))

(defun roosta/org-find-files ()
  "Quickly search in org folder"
  (interactive)
  (helm-find-files "~/org"))

;; Attempt to fix relative linum
;; (global-linum-mode)
;; (linum-relative-toggle)

;; ----------------------------------------------------
;; Keybindings
;; ----------------------------------------------------

(spacemacs/set-leader-keys "os" 'roosta/org-search)

;; Quick access to user-config
(spacemacs/set-leader-keys "feu" 'roosta/find-user-config)

;; opening project files
(spacemacs/set-leader-keys "oo" 'helm-projectile-find-file)

;; opening project files
(spacemacs/set-leader-keys "oi" 'roosta/org-find-files)

;; Change previous tab to this function, it hopefully preserves layout
;; (spacemacs/set-leader-keys "TAB" 'mode-line-other-buffer)

;; (defvar roosta-minor-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map (kbd "C-k") 'tmux-nav-up)
;;     (define-key map (kbd "C-j") 'tmux-nav-down)
;;     (define-key map (kbd "C-l") 'tmux-nav-right)
;;     (define-key map (kbd "C-h") 'tmux-nav-left)
;;     map)
;;   "roosta-minor-mode keymap.")

;; (define-minor-mode roosta-minor-mode
;;   "A minor mode so that my key settings override annoying major modes."
;;   :init-value t
;;   :lighter " r")

;; (roosta-minor-mode 1)

(evil-define-key 'normal term-raw-map
  (kbd "C-k") 'tmux-nav-up
  (kbd "C-j") 'tmux-nav-down
  (kbd "C-l") 'tmux-nav-right
  (kbd "C-h") 'tmux-nav-left
  (kbd "<C-up>") 'term-send-up
  (kbd "<C-down>") 'term-send-down
  (kbd "<C-return>") 'term-send-return)

(require 'cider)
(evil-define-key 'normal cider-repl-mode-map
  (kbd "C-k") 'tmux-nav-up
  (kbd "C-j") 'tmux-nav-down
  (kbd "C-l") 'tmux-nav-right
  (kbd "C-h") 'tmux-nav-left)

;; Navigating using visual lines, line break counts as new line when navigating
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; remap C-i (conflict with tab in tty)
(define-key evil-normal-state-map (kbd "M-o") 'evil-jump-forward)

(with-eval-after-load 'evil-surround
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region))

;; (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)

;; Quick eval, I rely to much on evil-; but keep this if I can think of a better place to put it
;; (evil-define-key 'normal clojurescript-mode-map ";" 'cider-eval-sexp-at-point)
;; (evil-define-key 'normal clojure-mode-map ";" 'cider-eval-sexp-at-point)

;; The following customization of the cider-repl-mode-map will change these
;; keybindings so that Return will introduce a new-line and C-RET will send the
;; form off for evaluation.
(define-key cider-repl-mode-map (kbd "RET") #'cider-repl-newline-and-indent)

;; Bind link slurp to match cleverparens
(define-key spacemacs-org-mode-map-prefix (kbd ">") 'org-link-edit-forward-slurp)
(define-key spacemacs-org-mode-map-prefix (kbd "<") 'org-link-edit-forward-barf)

(with-eval-after-load 'rust-mode
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common))

;; Bind escape to quit helm
(with-eval-after-load 'helm
  (define-key helm-map (kbd "ESC") 'helm-keyboard-quit))

;; Use escape to make C-Return work in terminal (termite)
(define-key cider-repl-mode-map "\e[27;5;13~" #'cider-repl-return)
(define-key org-mode-map "\e[27;5;13~" #'evil-org-org-insert-heading-respect-content-below)

;; cause seriously, now many times have I checked some output after assuming the
;; file has been saved and then been perplexed about why my changes aren't
;; reflected
(with-eval-after-load 'evil-maps
  (evil-ex-define-cmd "W" 'evil-write))

(with-eval-after-load 'company-mode
  (define-key company-active-map (kbd "M-k")   'company-show-doc-buffer))

;; ----------------------------------------------------
;; Terminal
;; ----------------------------------------------------
(unless (display-graphic-p)

  (xclip-mode 1)
  (xterm-mouse-mode 1)

  (defun my-undo-tree-hook ()
    (dolist (key '("C-/" "C-_"))
      (define-key undo-tree-map
        (read-kbd-macro key)
        nil)))

  (add-hook 'undo-tree-mode-hook 'my-undo-tree-hook)
  (define-key global-map (kbd "C-_") 'helm-company)
  (define-key global-map (kbd "C-/") 'helm-company)

  ;; Fix for terminal arrow keys. The escape seq in terminal for arrows keys are
  ;; the same as these bindings, causing emacs to call the function bound then
  ;; insert A, B, C, or D
  (with-eval-after-load 'evil-cleverparens
    (dolist (state '(normal visual operator))
      (dolist (key '("M-o" "M-O" "M-["))
        (evil-define-key state evil-cleverparens-mode-map
          (read-kbd-macro key)
          nil))))

  (with-eval-after-load 'dired+
      (dolist (key '("M-o" "M-O" "M-["))
        (define-key dired-mode-map
          (read-kbd-macro key)
          nil)))

  ;; (dolist (key '("\M-o" "\M-O" "\M-["))
  ;;   (global-unset-key key))

  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate) ; or (etcc-on)
  (setq
   ;; add a space between text and line numbers
   linum-relative-format "%3s "

   ;; Add some padding by the line number on terminal
   linum-format "%3s "
   ))

;; Mutt support.
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

;; ----------------------------------------------------
;; clojure
;; ----------------------------------------------------

(with-eval-after-load 'cider

  (require 'clojure-extras)

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

   ;; colorize usages of functions and variables from any namespace
   ;; cider-font-lock-dynamically '(macro core function var)
   ))

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

;; (require 're-jump)

;; ----------------------------------------------------
;; flycheck
;; ----------------------------------------------------
;; (eval-after-load 'flycheck '(flycheck-clojure-setup))
;; (add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-joker)
(add-to-list 'flycheck-global-modes 'clojure-mode)
(add-to-list 'flycheck-global-modes 'clojurescript-mode)

(with-eval-after-load 'flycheck
  (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;; ----------------------------------------------------
;; lisp
;; ----------------------------------------------------
(setq
 evil-cleverparens-use-additional-movement-keys t
 evil-cleverparens-use-s-and-S nil
 evil-cleverparens-swap-move-by-word-and-symbol nil)

(require 'evil-cleverparens)
(require 'evil-cleverparens-text-objects)

;; ----------------------------------------------------
;; org
;; ----------------------------------------------------
(with-eval-after-load 'org

  (require 'org-extras)

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
  ;; (add-hook 'org-mode-hook #'spacemacs/toggle-spelling-checking-on)

  ;; disabled linum in org since it cause serious slowdown on larger files
  (add-hook 'org-mode-hook #'spacemacs/toggle-line-numbers-off)
  ;; (add-hook 'org-mode-hook #'spacemacs/linum-relative-toggle)

  ;; persist clock on emacs restart
  (org-clock-persistence-insinuate)

  )

;; ----------------------------------------------------
;; markdown
;; ----------------------------------------------------
;; (add-hook 'markdown-mode-hook #'spacemacs/toggle-spelling-checking-on)

;; ----------------------------------------------------
;; Slack
;; ----------------------------------------------------
;; (if (file-directory-p "~/Private/slack")
;;     (progn (load-file "~/Private/slack/sic.el")
;;            (load-file "~/Private/slack/bitraf.el"))
;;   (message "~/Private is not mounted, cannot load slack config"))

;; (add-hook 'slack-mode-hook #'spacemacs/toggle-spelling-checking-on)

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
;; Git
;; ----------------------------------------------------
(if (file-directory-p "~/Private/github")
    (load-file "~/Private/github/github.el")
    (message "~/Private is not mounted, cannot load github config"))

(add-to-list 'load-path "~/.emacs.d/toc-org")

;; Generate TOC for github in org files
(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-enable)
  (warn "toc-org not found"))

;; (add-hook 'git-commit-setup-hook 'git-commit-turn-on-flyspell)
;; (add-hook 'magit-mode-hook #'spacemacs/toggle-spelling-checking-on)

;; --------------------------------------------------
;; Rust
;; --------------------------------------------------
;; (require 'rust-mode)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

;; --------------------------------------------------
;; evil-snipe
;; --------------------------------------------------
;; (with-eval-after-load 'evil-snipe
;;   (push '(?\[ "[[{(]") evil-snipe-aliases)
;;   (push '(?\] "[]})]") evil-snipe-aliases))

;; --------------------------------------------------
;; Helm
;; --------------------------------------------------

;; Prevent "display not ready" issue when opening helm in succession
;; https://github.com/emacs-helm/helm/issues/550
(setq helm-exit-idle-delay 0
      helm-echo-input-in-header-line nil)

;; --------------------------------------------------
;; Paren-face
;; --------------------------------------------------

;; Add maps
(setq paren-face-regexp "[][(){}]")

;; enable globally
(global-paren-face-mode)

;; --------------------------------------------------
;; Package-lint
;; --------------------------------------------------
(eval-after-load 'flycheck
  '(flycheck-package-setup))

;; --------------------------------------------------
;; org-bullets
;; --------------------------------------------------
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))

;; --------------------------------------------------
;; Origami
;; --------------------------------------------------
(setq origami-fold-style 'triple-braces)

;; --------------------------------------------------
;; Company
;; --------------------------------------------------
(setq
 company-tooltip-align-annotations t
 auto-completion-enable-sort-by-usage t)

(global-company-mode)

;; https://stackoverflow.com/questions/36719386/spacemacs-set-tab-width
(defun my-setup-indent (n)
  (setq

   ;; java/c/c++
   c-basic-offset n

   ;; coffeescript
   coffee-tab-width n

   ;; javascript-mode
   javascript-indent-level n

   ;; js-mode
   js-indent-level n

   ;; js2-mode, in latest js2-mode, it's alias of js-indent-level
   js2-basic-offset n

   ;; web-mode, html tag in html file
   web-mode-markup-indent-offset n

   ;; web-mode, css in html file
   web-mode-css-indent-offset n

   ;; web-mode, js code in html file
   web-mode-code-indent-offset n

   ;; css-mode
   css-indent-offset n))

(my-setup-indent 2)
