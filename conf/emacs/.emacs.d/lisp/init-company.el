;;; init-company.el --- company-mode configuration                 -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package company
  :defer t
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :custom
  (company-idle-delay 0.1)                          ; Trigger completion immediately.
  (company-show-numbers t)                          ; Number the candidates (use M-1, M-2 etc to select completions).
  (auto-completion-enable-sort-by-usage t)          ; sort candidates by usage
  (company-tooltip-align-annotations 't)            ; align annotations to the right tooltip border
  (company-tooltip-limit 20)                        ; bigger popup window
  (company-global-modes '(not shell-mode eaf-mode)) ; Don't use company in the following modes
  :config
  (defun smarter-yas-expand-next-field-complete ()
    "Try to `yas-expand' and `yas-next-field' at current cursor position.
If failed try to complete the common part with `company-complete-common'"
    (interactive)
    (if yas-minor-mode
        (let ((old-point (point))
              (old-tick (buffer-chars-modified-tick)))
          (yas-expand)
          (when (and (eq old-point (point))
                     (eq old-tick (buffer-chars-modified-tick)))
            (ignore-errors (yas-next-field))
            (when (and (eq old-point (point))
                       (eq old-tick (buffer-chars-modified-tick)))
              (company-complete-common))))
      (company-complete-common)))
  :general
  (company-active-map
   "M-q" 'company-other-backend                     ; Switch backend quickly
   "TAB" 'smarter-yas-expand-next-field-complete
   "C-/" 'counsel-company
   "C-_" 'counsel-company
   "C-d" 'company-show-doc-buffer))

(use-package company-lsp
  :defer t
  :custom
  (company-lsp-cache-candidates 'auto))

(use-package company-tabnine
  :defer 1
  :hook
  (lsp-after-open . (lambda ()
                      (setq company-tabnine-max-num-results 3)
                      (add-to-list 'company-transformers 'company//sort-by-tabnine t)
                      (add-to-list 'company-backends '(company-lsp :with company-tabnine :separate))))
  :commands
  (company-tabnine)
  :config
  ;; Enable TabNine on default
  (add-to-list 'company-backends #'company-tabnine)
  (defun company//sort-by-tabnine (candidates)
    (if (or (functionp company-backend)
            (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
        candidates
      (let ((candidates-table (make-hash-table :test #'equal))
            candidates-lsp
            candidates-tabnine)
        (dolist (candidate candidates)
          (if (eq (get-text-property 0 'company-backend candidate)
                  'company-tabnine)
              (unless (gethash candidate candidates-table)
                (push candidate candidates-tabnine))
            (push candidate candidates-lsp)
            (puthash candidate t candidates-table)))
        (setq candidates-lsp (nreverse candidates-lsp))
        (setq candidates-tabnine (nreverse candidates-tabnine))
        (nconc (seq-take candidates-tabnine 3)
               (seq-take candidates-lsp 6))))))

;; (use-package company-tern
;;   :after
;;   (company)
;;   :config
;;   (add-to-list 'company-backends 'company-tern))

;; (use-package company-web
;;   :after (company)
;;   :config
;;   (require 'company-web-html))

(provide 'init-company)
;;; init-company.el ends here
