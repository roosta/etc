;;; init-arduino.el --- Setup ardunio mode and conf  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package arduino-mode
  :config
  (setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist)))

(provide 'init-arduino)
;;; init-arduino.el ends here
