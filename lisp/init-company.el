(zhcosin/install-package-if-not-found 'company)

(use-package company-mode
  :config
  ;; 开启全局 Company 补全
  (global-company-mode t))

(provide 'init-company)
