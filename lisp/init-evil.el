(zhcosin/install-package-if-not-found 'evil)
;; enable or disable evil mode.
;; if you want turn on/off evil mode when emacs is running,
;; you can use M-x turn-on-evil-mode or turn-off-evil-mode.

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-search-wrap nil)
  (setq evil-normal-state-cursor '("red" box))
  :config
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  (evil-mode t))
;;(setq-default evil-auto-indent t)
;;(setq evil-shift-width 4)
;;(setq evil-repeat-move-cursor t) 
;;(setq evil-find-skip-newlines nil)
;;(setq evil-move-cursor-back t)
;;(setq evil-want-fine-undo nil)
;;(setq evil-regexp-search t)
;;(setq evil-search-wrap t)
;;(setq evil-flash-delay 3)
;;(setq evil-want-C-i-jump nil)
;;(setq evil-want-C-u-scrollnil)

(provide 'init-evil)
