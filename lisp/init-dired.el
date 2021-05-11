
(zhcosin/install-package-if-not-found 'dired-subtree)

(use-package dired-subtree
  :defer t
  :bind (:map dired-mode-map
              ("TAB" . dired-subtree-cycle)))

(provide 'init-dired)
