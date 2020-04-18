(zhcosin/install-package-if-not-found 'company-auctex)

(use-package company-auctex
  :config
  (add-hook 'LaTeX-mode-hook
    (lambda ()
      (make-local-variable 'company-backends)
      (setq company-backends '())
      (company-auctex-init))))

(provide 'init-company-auctex)
