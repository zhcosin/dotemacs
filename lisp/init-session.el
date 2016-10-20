(zhcosin/install-package-if-not-found 'session)

;;session.el
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(provide 'init-session)
