(zhcosin/install-package-if-not-found 'session)

(use-package session
  :config
  (add-hook 'after-init-hook 'session-initialize))

(provide 'init-session)
