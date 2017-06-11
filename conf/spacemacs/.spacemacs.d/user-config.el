(setq
 scroll-margin 7

 evil-ex-search-vim-style-regexp t

 ;; srcery-theme-org-height nil

 powerline-default-separator 'nil
 ;; spaceline-separator-dir-left '(left . left)
 ;; spaceline-separator-dir-right '(right . right)

 ;; always follow symlinks
 vc-follow-symlinks t

 ;; move across linebreaks
 evil-move-beyond-eol t

 yas-snippet-dirs
 '("~/.spacemacs.d/snippets")

 ;; set default browser
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "firefox"

 )

;; temporary fix for kill-ring pop. See https://github.com/syl20bnr/spacemacs/issues/8823
(define-key evil-normal-state-map (kbd "p") 'evil-paste-after)
(define-key evil-normal-state-map (kbd "P") 'evil-paste-before)

;; Cider
;; --------
(require 'cider)
;; use figwheel when starting a cljs repl
(setq

 ;; start cljs repl scripts/repl.clj in project
 cider-cljs-lein-repl "(require 'repl)"

 ;; cider-pprint-fn "puget"
 ;; clojure-enable-fancify-symbols t

 ;; use app lifecycle functions in cider-refresh
 cider-refresh-before-fn "user/stop"
 cider-refresh-after-fn "user/go"

 ;; always pretty print in repl
 cider-repl-use-pretty-printing t

 ;; Add to list to highlight more than macro and core
 ;; cider-font-lock-dynamically '(macro core function var)

 ;; add syntax highlighting to eval overlay
 cider-overlays-use-font-lock t
 )

(add-hook 'cider-repl-mode-hook #'evil-cleverparens-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)

;; flycheck
;; ------------
(eval-after-load 'flycheck '(flycheck-clojure-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;; smartparens
;; -------------
(setq
 evil-cleverparens-use-additional-movement-keys nil)

;; clojure
;; -------
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

;; Navigating using visual lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; opening project files
(spacemacs/set-leader-keys "o" 'helm-projectile-find-file)

;; evil-surround
;; -------------
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

;; org
;; ----------
(with-eval-after-load 'org

  (setq
    org-export-with-drawers t
    org-clock-persist 'history
    org-export-with-clocks t
    org-clock-idle-time 15
    org-mobile-directory "~/Dropbox/MobileOrg"
    org-mobile-files (quote ("~/org/TODOs.org" "~/org/buy.org" "~/org/shopping.org" "~/org/quick-notes.org"))
    org-agenda-files (quote ("~/org/TODOs.org")))
  (add-hook 'org-mode-hook #'spacemacs/toggle-spelling-checking-on)

  ;; drawer-export
  ;; https://stackoverflow.com/questions/7174819/export-effort-and-clocksum-from-org-mode
  (setq
   org-export-format-drawer-function 'jbd-org-export-format-drawer)

  (defun jbd-org-export-format-drawer (name content)
    "Export drawers to drawer HTML class."
    (setq content (org-remove-indentation content))
    (format "@<div class=\"drawer\">%s@</div>\n" content))

  (org-clock-persistence-insinuate))

;; markdown
;; --------
(add-hook 'markdown-mode-hook #'spacemacs/toggle-spelling-checking-on)

;; Slack
;; ------
;;(if (file-directory-p "~/Private/slack")
;;    (do (load-file "~/Private/slack/sic.el")
;;        (load-file "~/Private/slack/bitraf.el"))
;;  (message "~/Private is not mounted, cannot load slack config"))

(add-hook 'slack-mode-hook #'spacemacs/toggle-spelling-checking-on)

;; Alert
;; -----
(setq
 alert-default-style 'libnotify)

;; Flymd
;; -----
(defun my-flymd-browser-function (url)
  (let ((process-environment (browse-url-process-environment)))
    (apply 'start-process
           (concat "google-chrome-unstable " url) nil
           "google-chrome-unstable"
           (list "--allow-file-access-from-files" url "--force-device-scale-factor=1"))))
(setq flymd-browser-open-function 'my-flymd-browser-function)
