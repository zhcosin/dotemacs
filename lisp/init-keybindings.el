

;; 快速打开配置文件
(defun open-init-file()
   (interactive)
   (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数open-init-file()绑定到<F2>键上
(global-set-key (kbd "<f2>") 'open-init-file)

(provide 'init-keybindings)
