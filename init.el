
;; dotemacs file for zhcosin<zhcosin@163.com>.

;; note: 配置修改后生效
;; 在每次编辑配置文件后，刚刚做的修改并不会立刻生效。这时你需要重启编辑器或者重新加载配置文件。重新加载配置文件你需要在当前配置文件中使用 M-x load-file 双击两次回车确认默认文件名，或者使用 M-x eval-buffer 去执行当前缓冲区的所有 Lisp 命令。你也可以使用 C-x C-e 来执行某一行的 Lisp 代码。这些可使刚刚修改的配置文件生效。当然你也可以将这些函数绑定为快捷键。

(defconst cosin/befor-init-time (current-time))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
;;(require 'init-ido)
(require 'init-keybindings)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-default)
(require 'init-colortheme)
(require 'init-window-number)
(require 'init-orgmode)
(require 'init-company)
;;(require 'init-smex)
(require 'init-helm)
(require 'init-tramp)
(require 'init-evil)
(require 'init-session)
(require 'init-desktop)
;;(require 'init-ox-latex-chinese)
(require 'init-auctex)
(require 'init-company-auctex)
(require 'init-org-page)
;;(require 'init-ego)
(require 'utils)
(require 'init-chinese-number)
;;(require 'init-flycheck)
(require 'init-scheme)
(require 'init-parinfer)
;;(require 'autopair)
(require 'init-helm-swoop)

(defconst cosin/after-init-time (current-time))

(message "This start spent %.2f seconds." (float-time (subtract-time cosin/after-init-time cosin/befor-init-time)))
