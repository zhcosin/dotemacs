
;; enable TAB completion in eshell.
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

(provide 'init-eshell)
