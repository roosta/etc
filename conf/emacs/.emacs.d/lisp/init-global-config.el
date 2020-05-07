;;; init-global-config.el --- Initialize global configuration  -*- lexical-binding: t; -*-

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

(setq
  debug-on-error t                             ; Produce backtraces when errors occur
  exec-path-from-shell-check-startup-files nil ; disable warning about setting path outside profile/env
  vc-follow-symlinks t                         ; always follow symlinks
  visual-bell nil                              ; disable visual bell, I find it very distracting when reaching top or bottom of buffer
  initial-scratch-message nil                  ; Remove intro text in scratch buffer
  server-kill-new-buffers nil                  ; Prevent closing buffers when exiting frame in terminal (WIP)
  )


(provide 'init-global-config)
;;; init-global-config.el ends here
