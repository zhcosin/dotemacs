;; enable automatic cut a long line into many lines on screen
;; when edit a *.org file.
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil))) 

;; 开启Org-mode文本内语法高亮
(require 'org)
(require 'ox-latex)
(setq org-src-fontify-natively t)

;; 在 org 允许文件中执行代码块
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (java . t)
   (js . t)
   (sql . t)
   (ruby . t)
   (python . t)
   (shell . t)
   (latex . t)
   (plantuml . t)))

;; 设置 org 导出为 html 时公式的 mathjax 处理参数
(setq org-html-mathjax-options
      '((path "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML")
	(scale "100")
	(align "center")
	(indent "2em")
	(mathml nil)))

(setq org-html-mathjax-template
      "<script type=\"text/javascript\" src=\"%PATH\"></script>")


;; for export latex
(add-to-list 'org-latex-classes
	     '("ctexart"
	       "\\documentclass[UTF8,a4paper]{ctexart}"
	       ;;"\\documentclass[fontset=none,UTF8,a4paper,zihao=-4]{ctexart}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	       )
	     )


(add-to-list 'org-latex-classes
	       '("ctexrep"
		"\\documentclass[UTF8,a4paper]{ctexrep}"
		("\\part{%s}" . "\\part*{%s}")
		("\\chapter{%s}" . "\\chapter*{%s}")
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       )
	       )

(add-to-list 'org-latex-classes
	       '("ctexbook"
		"\\documentclass[UTF8,a4paper]{ctexbook}"
		;;("\\part{%s}" . "\\part*{%s}")
		("\\chapter{%s}" . "\\chapter*{%s}")
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       )
	       )

(add-to-list 'org-latex-classes
	       '("beamer"
		"\\documentclass{beamer}
               \\usepackage[fontset=none,UTF8,a4paper,zihao=-4]{ctex}"
	       org-beamer-sectioning)
	       )
	       

(setq org-latex-default-class "ctexart")

(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
       "xelatex -interaction nonstopmode -output-directory %o %f"
       "xelatex -interaction nonstopmode -output-directory %o %f"))

;; for math.
(defun zhcosin/insert-inline-formulas()
  (interactive)
  (insert "\\(  \\)")
  (backward-char 3))
   
(define-key org-mode-map (kbd "M-$") 'zhcosin/insert-inline-formulas)

(provide 'init-orgmode)
