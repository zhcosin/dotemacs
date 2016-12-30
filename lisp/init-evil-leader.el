
(zhcosin/install-package-if-not-found 'evil-leader)

(require 'evil-leader)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "f" 'helm-find-files
  "s" 'save-buffer)

(provide 'init-evil-leader)
