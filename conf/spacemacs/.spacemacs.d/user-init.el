(setq-default
 ;; evil-shift-round nil

 srcery-transparent-background t

 custom-theme-directory "~/src/srcery-emacs"

 ;; disable waring for setting path outside profile/env
 exec-path-from-shell-check-startup-files nil)

(push "~/.spacemacs.d/layers" load-path)
