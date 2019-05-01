;;; init-xterm.el --- Integrate with terminals such as xterm -*- lexical-binding: t -*-
;;; Source: https://github.com/purcell/emacs.d/blob/master/lisp/init-xterm.el
;;; Commentary:
;;; Code:

(require 'init-frame-hooks)

(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

(autoload 'mwheel-install "mwheel")

(after-load 'evil
  (ensure-lib-from-url
   'tmux
   "https://raw.githubusercontent.com/syl20bnr/spacemacs/master/layers/%2Btools/tmux/local/tmux/tmux.el")
  (require 'tmux))

(defun roosta/console-frame-setup ()

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
    (etcc-on))

  (xterm-mouse-mode 1) ; Mouse in a terminal (Use shift to paste with middle button)
  (mwheel-install))

(add-hook 'after-make-console-frame-hooks 'roosta/console-frame-setup)

(provide 'init-xterm)
;;; init-xterm.el ends here
