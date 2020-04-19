(zhcosin/install-package-if-not-found 'company)

(use-package company
  :config
  (global-company-mode 1)

  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))
  
(provide 'init-company)
