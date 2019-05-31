;添加 asy-mode.el 文件所在目录，路径按操作系统区分.
(cond ((eq system-type 'windows-nt)(add-to-list 'load-path "E:\\texlive\\2015\\texmf-dist\\asymptote"))
      ((eq system-type 'gnu/linux)(add-to-list 'load-path "/usr/local/texlive/2017/texmf-dist/asymptote")))

(autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
(autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
(autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
(add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))

(provide 'init-asy)
