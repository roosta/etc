;;; init-rust.el ---                                -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; TODO S-k should use racer
;; TODO gg should go to definition

(use-package cargo
  :general
  ('(normal visual evilified) js2-mode-map :prefix ","
   "c." 'cargo-process-repeat
   "cC" 'cargo-process-clean
   "cX" 'cargo-process-run-example
   "cc" 'cargo-process-build
   "cd" 'cargo-process-doc
   "ce" 'cargo-process-bench
   "cf" 'cargo-process-current-test
   "cf" 'cargo-process-fmt
   "ci" 'cargo-process-init
   "cn" 'cargo-process-new
   "co" 'cargo-process-current-file-tests
   "cs" 'cargo-process-search
   "cu" 'cargo-process-update
   "cx" 'cargo-process-run
   "t" 'cargo-process-test
   ))

(use-package flycheck-rust
  :commands (flycheck-rust-setup)
  :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(defun spacemacs/rust-quick-run ()
  "Quickly run a Rust file using rustc.
Meant for a quick-prototype flow only - use
`spacemacs/open-junk-file' to open a junk Rust file, type in some
code and quickly run it.  If you want to use third-party crates,
create a a new project using `cargo-process-new' and run using
`cargo-process-run'."
  (interactive)
  (let ((input-file-name (buffer-file-name))
        (output-file-name (concat temporary-file-directory (make-temp-name "rustbin"))))
    (compile
     (format "rustc -o %s %s && %s"
             (shell-quote-argument output-file-name)
             (shell-quote-argument input-file-name)
             (shell-quote-argument output-file-name)))))

(with-eval-after-load 'smartparens
    ;; Don't pair lifetime specifiers
    (sp-local-pair 'rust-mode "'" nil :actions nil))

(use-package rust-mode
  :general
  ('(normal visual evilified) js2-mode-map :prefix ","
   "=" #'rust-format-buffer
   "q" #'spacemacs/rust-quick-run))

(use-package toml-mode
  :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")

(use-package racer
  :hook
  ((rust-mode . racer-mode)
   (racer-mode . eldoc-mode)))

(provide 'init-rust)
;;; init-rust.el ends here
