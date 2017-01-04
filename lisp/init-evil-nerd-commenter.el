
(zhcosin/install-package-if-not-found 'evil-nerd-commenter)

(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(provide 'init-evil-nerd-commenter)
