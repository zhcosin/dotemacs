
;; 开启左侧行号显示
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; 关闭自动备份
;;(setq make-backup-files nil)

;; 关闭自动保存功能
(setq auto-save-default nil)

;; 关闭错误提示声音
(setq ring-bell-function 'ignore)

;;;;;;;;;;;;;;; set the style for display datetime ;;;;;;;;;;;;;;;;
;; enable show time on the bar above on the minibuffer.
(display-time-mode 1) 
;; use 24h time format.
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;; answerd with y-or-n instead of yes-or-no when query. 
(fset 'yes-or-no-p 'y-or-n-p) 

;; show match bracket when cursor on a left or right bracket.
(show-paren-mode t)
;; hightlight the match bracket instead of move the cursor
;; to it.
(setq show-paren-style 'parenthesis) 

(setq frame-title-format
      '(buffer-file-name "emacs %b - %f" ; File buffer
       (dired-directory dired-directory ; Dired buffer
            (revert-buffer-function "%b" ; Buffer Menu
                  ("%b - Dir: " default-directory))))) ; Plain buffer

;; 显示当前 buffer 对应文件全路径
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

;;(when (display-graphic-p)
;; Setting English Font
;;(set-face-attribute
;;'default nil :font "Consolas 11")
;; Chinese Font
;;(dolist (charset '(kana han symbol cjk-misc bopomofo))
;;(set-fontset-font (frame-parameter nil 'font)
;;charset
;;(font-spec :family "Microsoft Yahei" :size 16)))
;;)

(when (display-graphic-p)
  (set-face-attribute 'default nil :font
          (format   "%s:pixelsize=%d" "Source Code Pro" 13))
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
          (font-spec :family "微软雅黑" :size 16))))
  

;; set coding system.
;; you can try the follow command to reload file with
;; specified coding system to the buffer if you encoutered
;; messy code when open a file.
;; M-x revert-buffer-with-coding-system RET
;; then type the specified coding system such as utf-8
;; or chinese-gbk.
;; and you can specified the coding system which use
;; to save file with the follow command.
;; M-x set-buffer-file-coding-system
;;(set-language-environment "UTF-8") ;; 开启会导致在 *.yaml 文件中光标移动卡顿，暂未找到解决办法，临时禁用. 2020-04-04
(set-default-coding-systems 'utf-8)
;;(set-file-name-coding-system 'gb18030)
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(set-clipboard-coding-system 'utf-8)
;;(set-buffer-file-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(modify-coding-system-alist 'process "*" 'utf-8)
(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-16-le)

;; 指定保存 session 文件时使用的编码.
(setq session-save-file-coding-system 'utf-8)

;; 启动时忽略 desktop 的加锁文件，以避免加载 desktop 文件时的询问.
(setq desktop-load-locked-desktop t)
;; 总是在退出时保存 desktop 文件.
(setq desktop-save t)
(desktop-save-mode 1)

;; 使用下面的配置将删除功能配置成与其他图形界面的编辑器相同，即当你选中一段文字之后输入一个字符会替换掉你选中部分的文字。
(delete-selection-mode t)

;; 启用自动括号匹配(Highlight Matching Parenthesis)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; Hightlight current line only on GUI, not in terminal, avoid to couldn't find cursor position. 2016-11-28
(when (display-graphic-p)
  (global-hl-line-mode t))

;; 指定保存 .emacs.d/recentf 文件时使用的编码.
(setq recentf-save-file-coding-system 'utf-8)

;; 自动加载外部修改过的文件
(global-auto-revert-mode t)

;; indent-region 可以帮我们重新缩进所选区域的代码，但是每一次都选中十分麻烦。使用下面的代码可以一次重新缩进全部缓冲区的代码。（之后也会介绍更好用的，代码格式美化的插件）
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; 将其用下面的代码将其绑定为快捷键，第一个 \ 用于将紧跟的 \ 进行逃脱（escape）
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
;;  使用 C-x d 就可以进入 Dired Mode，这个模式类似于图形界面系统中的资源管理器。你可以在其中查看文件和目录的详细信息，对他们进行各种操作，甚至复制粘贴缓冲区中的内容。下面是一些常用的操作（下面的所有键均需在 Dired Mode 下使用），

;;    + 创建目录
;;    g 刷新目录
;;    C 拷贝
;;    D 删除
;;    R 重命名
;;    d 标记删除
;;    u 取消标记
;;    x 执行所有的标记

;; 让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区。 
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
 (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进入当前文件夹的所在的路径。
(require 'dired-x)

;;  还有一个小问题就是解决在不同系统中的换行符，例如在 DOS 系统下的 \M 换行符，这让我们有时候在 Unix 系统中很是头疼，因为它的存在会使版本控制误以为整行的代码都被修改过而造成不必要的麻烦。（你可以在这里找到更多关于 \M 的信息）,下面是删除这个换行符的函数.， 
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; show-paren-mode 可以使鼠标在括号上是高亮其所匹配的另一半括号，然而我们想要光标在括号内时就高亮包含内容的两个括号，使用下面的代码就可以做到这一点。
;;(define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;  "Highlight enclosing parens."
;;  (cond ((looking-at-p "\\s(") (funcall fn))
;;	(t (save-excursion
;;	     (ignore-errors (backward-up-list))
;;	     (funcall fn)))))

(provide 'init-better-default)
