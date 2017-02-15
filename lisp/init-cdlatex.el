
(zhcosin/install-package-if-not-found 'cdlatex)

(use-package cdlatex
  :config
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex))
  

(provide 'init-cdlatex)
