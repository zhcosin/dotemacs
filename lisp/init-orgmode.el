;; enable automatic cut a long line into many lines on screen
;; when edit a *.org file.
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil))) 

;; 开启Org-mode文本内语法高亮
(require 'org)
(require 'ox-latex)
(setq org-src-fontify-natively t)

;; for export latex
(add-to-list 'org-latex-classes
	     '("ctexart"
	       "\\documentclass{ctexart}"))
(setq org-latex-default-class "ctexart")

(provide 'init-orgmode)
