
(zhcosin/install-package-if-not-found 'deft)

(use-package deft
  :config
  (setq deft-extensions '("txt" "org"))
  (setq deft-directory "F:/notes")
  (setq deft-recursive t))

(provide 'init-deft)
