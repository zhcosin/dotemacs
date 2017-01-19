(zhcosin/install-package-if-not-found 'desktop)

(use-package desktop
  :config
  (desktop-load-default) 
  (desktop-read))

(provide 'init-desktop)
