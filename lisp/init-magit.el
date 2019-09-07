
(zhcosin/install-package-if-not-found 'magit)

;; 绑定git仓库目录状态命令
(global-set-key (kbd "C-x g") 'magit-status)

;; 在对文件修改内容进行部分暂存/提交时，设置标记按键 C-SPC 会被输入法捕获，因此将设置标记绑定到 M-SPC 按键.
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

(provide 'init-magit)
