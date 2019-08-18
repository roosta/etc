;;; init-windows.el --- Working with windows within frames  -*- lexical-binding: t; -*-
;;; Commentary:

;; This is not about the "Windows" OS, but rather Emacs's "windows"
;; concept: these are the panels within an Emacs frame which contain
;; buffers.

;; A lot of functions is borrowed from spacemacs from here:
;; https://github.com/syl20bnr/spacemacs/blob/master/layers/%2Bdistributions/spacemacs-base/funcs.el
;; https://github.com/syl20bnr/spacemacs/blob/master/core/core-funcs.el

;;; Code:

(require 'winner)
(require 'evil)

;;----------------------------------------------------------------------------
;; Config
;;----------------------------------------------------------------------------
(when (fboundp 'winner-mode)
  (winner-mode 1))

;;----------------------------------------------------------------------------
;; Packages
;;----------------------------------------------------------------------------
(use-package golden-ratio
  :commands
  (golden-ratio
   golden-ratio-mode))


;;----------------------------------------------------------------------------
;; Functions
;;----------------------------------------------------------------------------
(defun split-window-below-and-focus ()
  "Split the window vertically and focus the new window."
  (interactive)
  (split-window-below)
  (windmove-down)
  (when (and (boundp 'golden-ratio-mode)
             (symbol-value golden-ratio-mode))
    (golden-ratio)))

(defun split-window-right-and-focus ()
  "Split the window horizontally and focus the new window."
  (interactive)
  (split-window-right)
  (windmove-right)
  (when (and (boundp 'golden-ratio-mode)
             (symbol-value golden-ratio-mode))
    (golden-ratio)))

(defun spacemacs/alternate-window ()
  "Switch back and forth between current and last window in the current frame."
  (interactive)
  (let (;; switch to first window previously shown in this frame
        (prev-window (get-mru-window nil t t)))
    ;; Check window was not found successfully
    (unless prev-window (user-error "Last window not found"))
    (select-window prev-window)))

(defun spacemacs/layout-double-columns ()
  "Set the layout to double columns."
  (interactive)
  (delete-other-windows)
  (split-window-right))

(defun spacemacs/layout-triple-columns ()
  "Set the layout to triple columns."
  (interactive)
  (delete-other-windows)
  (dotimes (_ 2) (split-window-right))
  (balance-windows))

(defun spacemacs/switch-to-minibuffer-window ()
  "Switch to minibuffer window (if active)."
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))

(defun spacemacs/delete-window (&optional arg)
  "Delete the current window.
If the universal prefix argument ARG is used then kill the buffer too."
  (interactive "P")
  (if (equal '(4) arg)
      (kill-buffer-and-window)
    (delete-window)))

;; from http://dfan.org/blog/2009/02/19/emacs-dedicated-windows/
(defun spacemacs/toggle-current-window-dedication ()
  "Toggle dedication state of a window."
 (interactive)
 (let* ((window    (selected-window))
        (dedicated (window-dedicated-p window)))
   (set-window-dedicated-p window (not dedicated))
   (message "Window %sdedicated to %s"
            (if dedicated "no longer " "")
            (buffer-name))))

;; from https://gist.github.com/3402786
(defun spacemacs/toggle-maximize-buffer ()
  "Maximize buffer."
  (interactive)
  (if (and (= 1 (length (window-list)))
           (assoc ?_ register-alist))
      (jump-to-register ?_)
    (progn
      (window-configuration-to-register ?_)
      (delete-other-windows))))

(defun spacemacs/toggle-centered-buffer-mode ()
  "Toggle `spacemacs-centered-buffer-mode'."
  (interactive)
  (when (require 'centered-buffer-mode nil t)
    (call-interactively 'spacemacs-centered-buffer-mode)))

(defun spacemacs/centered-buffer-mode-full-width ()
  "Center buffer in the frame."
  (interactive)
  (when (require 'centered-buffer-mode nil t)
    (spacemacs/maximize-horizontally)
    (call-interactively 'spacemacs-centered-buffer-mode)))

;; originally from magnars and modified by ffevotte for dedicated windows
;; support, it has quite diverged by now
(defun spacemacs/rotate-windows-forward (count)
  "Rotate each window forwards by COUNT.
A negative prefix argument rotates each window backwards.
Dedicated (locked) windows are left untouched."
  (interactive "p")
  (let* ((non-dedicated-windows (cl-remove-if 'window-dedicated-p (window-list)))
         (states (mapcar #'window-state-get non-dedicated-windows))
         (num-windows (length non-dedicated-windows))
         (step (+ num-windows count)))
    (if (< num-windows 2)
        (error "You can't rotate a single window!")
      (dotimes (i num-windows)
        (window-state-put
         (elt states i)
         (elt non-dedicated-windows (% (+ step i) num-windows)))))))

(defun spacemacs/rotate-windows-backward (count)
  "Rotate each window backwards by COUNT.
Dedicated (locked) windows are left untouched."
  (interactive "p")
  (spacemacs/rotate-windows-forward (* -1 count)))

;; from @bmag
(defun spacemacs/window-layout-toggle ()
  "Toggle between horizontal and vertical layout of two windows."
  (interactive)
  (if (= (count-windows) 2)
    (let* ((window-tree (car (window-tree)))
           (current-split-vertical-p (car window-tree))
           (first-window (nth 2 window-tree))
           (second-window (nth 3 window-tree))
           (second-window-state (window-state-get second-window))
           (splitter (if current-split-vertical-p
                         #'split-window-horizontally
                       #'split-window-vertically)))
      (delete-other-windows first-window)
      ;; `window-state-put' also re-selects the window if needed, so we don't
      ;; need to call `select-window'
      (window-state-put second-window-state (funcall splitter)))
    (error "Can't toggle window layout when the number of windows isn't two")))

;; https://tsdh.wordpress.com/2007/03/28/deleting-windows-vertically-or-horizontally/
(defun spacemacs/maximize-horizontally ()
  "Delete all windows left or right of the current window."
  (interactive)
  (require 'windmove)
  (save-excursion
    (while (condition-case nil (windmove-left) (error nil))
      (delete-window))
    (while (condition-case nil (windmove-right) (error nil))
      (delete-window))))

;;----------------------------------------------------------------------------
;; Keybindings
;;----------------------------------------------------------------------------
(general-def '(normal visual evilified) :prefix "SPC" :non-normal-prefix "C-SPC"
  "w TAB"       #'(spacemacs/alternate-window :which-key "alternate-window")
  "w2"          #'(spacemacs/layout-double-columns :which-key "layout-double-columns")
  "w3"          #'(spacemacs/layout-triple-columns :which-key "layout-triple-columns")
  "wb"          #'(spacemacs/switch-to-minibuffer-window :which-key "switch-to-minibuffer-window")
  "wd"          #'(spacemacs/delete-window :which-key "delete-window")
  "wt"          #'(spacemacs/toggle-current-window-dedication :which-key "toggle-current")
  "wf"          #'follow-mode
  "wF"          #'make-frame
  "wH"          #'evil-window-move-far-left
  "w <S-left>"  #'evil-window-move-far-left
  "wh"          #'evil-window-left
  "w <left>"    #'evil-window-left
  "wJ"          #'evil-window-move-very-bottom
  "w <S-down>"  #'evil-window-move-very-bottom
  "wj"          #'evil-window-down
  "w <down>"    #'evil-window-down
  "wK"          #'evil-window-move-very-top
  "w <S-up>"    #'evil-window-move-very-top
  "wk"          #'evil-window-up
  "w <up>"      #'evil-window-up
  "wL"          #'evil-window-move-far-right
  "w <S-right>" #'evil-window-move-far-right
  "wl"          #'evil-window-right
  "w <right>"   #'evil-window-right
  "wm"          #'(spacemacs/toggle-maximize-buffer :which-key "toggle-maximize-buffer")
  "wc"          #'(spacemacs/toggle-centered-buffer-mode :which-key "toggle-centered-buffer-mode")
  "wC"          #'(spacemacs/centered-buffer-mode-full-width :which-key "centered-buffer-mode-full-width")
  "wo"          #'other-frame
  "wr"          #'(spacemacs/rotate-windows-forward :which-key "rotate-windows-forward")
  "wR"          #'(spacemacs/rotate-windows-backward :which-key "rotate-windows-backward")
  "ws"          #'split-window-below
  "wS"          #'split-window-below-and-focus
  "w-"          #'split-window-below
  "wU"          #'winner-redo
  "wu"          #'winner-undo
  "wv"          #'split-window-right
  "wV"          #'split-window-right-and-focus
  "ww"          #'other-window
  "w/"          #'split-window-right
  "w="          #'balance-windows
  "w+"          #'(spacemacs/window-layout-toggle :which-key "window-layout-toggle")
  "w_"          #'(spacemacs/maximize-horizontally :which-key "maximize-horizontally"))

(which-key-add-key-based-replacements
  "SPC w" "window")

(provide 'init-windows)
;;; init-windows.el ends here
