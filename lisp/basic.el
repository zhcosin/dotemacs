;; focus on the end of a line, and press C-x C-e, the configure of
;; this line will be applied intermediate.
;; select a region , M-x eval-region
;; M-x load-file ~/.emacs
;; M-x eval-buffer

;; set the initialize position of the windows of emacs.
(set-frame-position (selected-frame) 235 130) 
;; set the initialize width and height of the windows of emacs.
(set-frame-width (selected-frame) 100)
(set-frame-height (selected-frame) 30)

;; show the number of each line.
(global-linum-mode t)

;; show the number of column.
(column-number-mode t)

;; show the file and path of current buffer in title.
(setq frame-title-format "emacs@%f")

;; hide the menu bar and the tool bar
(menu-bar-mode 1)
(tool-bar-mode 0)

;; scroll one line at a time.
(setq scroll-step 1)
;; atuoscroll when focus is close to margin.
(setq scroll-margin 3)

;; set indent with tab and the width of tab key.
(setq-default indent-tabs-mode 0) 
(setq default-tab-width 4) 

;; highlight marked region
(transient-mark-mode t)

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

;; Setting English Font
(set-face-attribute
'default nil :font "Consolas 11")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "Microsoft Yahei" :size 16)))

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
(set-language-environment "UTF-8")
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

(provide 'basic)
