;;; init-misc.el --- Miscellaneous configs not fitting in any of the other init els  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(which-key-add-key-based-replacements
  "SPC S" "spelling"
  "SPC f" "file"
  "SPC g" "git"
  "SPC b" "buffers"
  "SPC h" "help"
  "SPC i" "insert"
  "SPC j" "jump"
  "SPC p" "projects"
  "SPC o" "roosta"
  "SPC q" "quit"
  "SPC r" "registers/rings/resume"
  "SPC s" "search"
  "SPC w" "windows")

(provide 'init-misc)
;;; init-misc.el ends here
