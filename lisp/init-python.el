
(zhcosin/install-package-if-not-found 'elpy)
(zhcosin/install-package-if-not-found 'flycheck)
(zhcosin/install-package-if-not-found 'material-theme)

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'init-python)
