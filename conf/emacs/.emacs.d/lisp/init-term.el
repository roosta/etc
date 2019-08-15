;;; init-term.el --- Integrate with terminals such as xterm -*- lexical-binding: t -*-
;;; Source: https://github.com/purcell/emacs.d/blob/master/lisp/init-xterm.el
;;; Commentary:
;;; Code:

(require 'init-frame-hooks)
(require 'init-utils)
(require 'init-site-lisp)

;;----------------------------------------------------------------------------
;; Mouse support
;;----------------------------------------------------------------------------
(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

(autoload 'mwheel-install "mwheel")

;;----------------------------------------------------------------------------
;; Tmux navigation
;;----------------------------------------------------------------------------
(after-load 'evil
  (ensure-lib-from-url
   'tmux
   "https://raw.githubusercontent.com/syl20bnr/spacemacs/master/layers/%2Btools/tmux/local/tmux/tmux.el")
  (require 'tmux))

(declare-function tmux-nav-up tmux)
(declare-function tmux-nav-down tmux)
(declare-function tmux-nav-left tmux)
(declare-function tmux-nav-right tmux)

;; Add some overrides here, certain buffers the tmux nav doesn't work
(general-def '(normal visual operator) (sql-mode-map sql-interactive-mode-map magit-diff-mode-map term-raw-map skewer-repl-mode-map)
  "C-k" #'tmux-nav-up
  "C-j" #'tmux-nav-down
  "C-l" #'tmux-nav-right
  "C-h" #'tmux-nav-left)

;;----------------------------------------------------------------------------
;; Emacs terminal
;;----------------------------------------------------------------------------
(general-def '(normal visual operator) (term-raw-map)
  "<C-up>" 'term-send-up
  "<C-down>" 'term-send-down
  "<C-return>" 'term-send-return)

(general-def '(normal visual evilified) :prefix "SPC" :non-normal-prefix "C-SPC"
  "'" #'eshell)

;;----------------------------------------------------------------------------
;; console frame hook
;;----------------------------------------------------------------------------
(defun roosta/console-frame-setup ()
  "Console spesific config."

  (after-load 'evil-cleverparens
    ;; Unbind troublesome keybinds when in terminal.  Fixes issue with
    ;; mouse wheel, arrow keys, since these map to the same escape
    ;; sequence.
    (general-def '(normal visual operator) evil-cleverparens-mode-map
      "M-o" nil
      "M-[" nil))

  (use-package xclip
    :config
    (xclip-mode 1))

  (use-package evil-terminal-cursor-changer
    :after (evil)
    :init
    (setq evil-motion-state-cursor 'box)  ; █
    (setq evil-visual-state-cursor 'box)  ; █
    (setq evil-normal-state-cursor 'box)  ; █
    (setq evil-insert-state-cursor 'bar)  ; ⎸
    (setq evil-emacs-state-cursor  'hbar) ; _
    :config
    (when (fboundp 'etcc-on)
      (etcc-on)))

  (xterm-mouse-mode 1) ; Mouse in a terminal (Use shift to paste with middle button)
  (mwheel-install))

(add-hook 'after-make-console-frame-hooks 'roosta/console-frame-setup)

(provide 'init-term)
;;; init-term.el ends here
