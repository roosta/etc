;;; init-server.el --- Initialize emacs daemon/server  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Daniel Berg

;; Author: Daniel Berg <mail@roosta.sh>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

;; Prevent closing buffers when exiting frame using emacsclient
(setq server-kill-new-buffers nil)

;; We do want to kill temp buffers
(setq server-temp-file-regexp
      "^/tmp/Re\\|/draft$\\|^/var/tmp\\|^/dev/shm\\|\\.git/COMMIT_EDITMSG")


;; Start server when opening an emacs instance
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (if (and (fboundp 'server-running-p)
                     (not (server-running-p)))
                (server-start))))

(provide 'init-server)
;;; init-server.el ends here
