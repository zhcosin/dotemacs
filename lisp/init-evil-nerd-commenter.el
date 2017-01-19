
(zhcosin/install-package-if-not-found 'evil-nerd-commenter)

(use-package evil-nerd-commenter
  :config
  (evilnc-default-hotkeys)
  (define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines))

(provide 'init-evil-nerd-commenter)
