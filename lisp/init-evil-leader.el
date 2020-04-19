
(zhcosin/install-package-if-not-found 'evil-leader)

(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "<SPC>" 'helm-M-x
    "0" 'select-window-0
    "1" 'select-window-1
    "2" 'select-window-2
    "3" 'select-window-3
    "4" 'select-window-4
    "5" 'select-window-5
    "6" 'select-window-6
    "7" 'select-window-7
    "8" 'select-window-8
    "9" 'select-window-9
    "qq" 'save-buffers-kill-terminal
    "ff" 'helm-find-files
    "fs" 'save-buffer
    "bb" 'switch-to-buffer
    "bk" 'kill-buffer
    "bl" 'electric-buffer-list
    "hdf" 'describe-function
    "hdv" 'describe-variable
    "hdk" 'describe-key
    "hdo" 'describe-symbol
    "w-" 'split-window-below
    "w/" 'split-window-right
    "w=" 'balance-windows
    "wh" 'evil-window-left
    "wl" 'evil-window-right
    "wj" 'evil-window-down
    "wk" 'evil-window-up)
  )

(provide 'init-evil-leader)
