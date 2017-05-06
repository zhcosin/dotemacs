
;; Enable full screen when start.
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 开启菜单栏
(menu-bar-mode 1)

;; 关闭工具栏, tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

(when (display-graphic-p)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
)

;; 更改光标的样式，
;; setq 设置当前缓冲区中的变量值，setq-default设置的为全局的变量的值.
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; scroll one line at a time.
(setq scroll-step 1)
;; atuoscroll when focus is close to margin.
(setq scroll-margin 3)

;; highlight marked region
(transient-mark-mode t)

(provide 'init-ui)
