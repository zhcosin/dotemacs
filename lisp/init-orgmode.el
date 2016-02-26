;; enable automatic cut a long line into many lines on screen
;; when edit a *.org file.
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil))) 

(provide 'init-orgmode)
