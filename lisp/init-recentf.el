
(require 'recentf)
(require 'init-evil-leader)

(recentf-mode 1)

;; 设置 recentf-list 的最大长度
(setq recentf-max-saved-items 50)

;; 指定保存 .emacs.d/recentf 文件时使用的编码.
(setq recentf-save-file-coding-system 'utf-8)

;;;###autoload
(define-minor-mode zhcosin/recentf-mode
  "Minor mode for mark/unmark recent files to open."
  :keymap (let ((map (make-sparse-keymap)))
            (evil-define-key 'normal map (kbd "m") #'org-ctrl-c-ctrl-c)
            map)
  (evil-normalize-keymaps))

;; 批量打开近期文件，随后此函数被绑定到 C-x C-r 上.
;; 使用方法:
;;  - 按下 C-x C-r 打开展示近期文件列表的 buffer.
;;  - 按 C-c C-c 进行勾选/反勾选.
;;  - 再次按下 C-x C-r，被选中的多个文件将同时打开.
;; 在勾选过程中若要中止打开文件，可以直接关闭 buffer 即可，也可全部反勾选后按 C-x C-r.
(defun zhcosin/open-recent-files ()
  (interactive)
  (let ((select-buffer "*open recent files*"))
    (if (buffer-live-p (get-buffer select-buffer))
      (progn
        (with-current-buffer select-buffer
          (let ((content-lines (split-string (buffer-string) "\n" t)))
            (dolist (content-line content-lines)
              (when (string-match "^\\s-*-\\s-*\\(\\[X\\]\\)\\s-*\\(.*\\)$" content-line)
                (let ((the-file-name (substring content-line (match-beginning 2) (match-end 2))))
                  (message (concat "open recent file: " the-file-name))
                  (find-file the-file-name))))))
        (kill-buffer select-buffer)) 
      (progn
        (get-buffer-create select-buffer)
        (switch-to-buffer (get-buffer select-buffer))
        (org-mode)
	(zhcosin/recentf-mode t)
        (insert "\n  recent file list:\n\n")
        (dolist (file recentf-list)
          (insert (concat " - [ ] " file "\n")))
        (goto-line 1)))))

;; 按 C-x C-r 打开近期文件列表，该按键原本绑定的命令是 find-file-read-only，即以只读方式打开文件，不常用,
;; 因此绑定此自定义函数.
(global-set-key "\C-x\ \C-r" 'zhcosin/open-recent-files)

(evil-leader/set-key
    "fr" 'zhcosin/open-recent-files)

(provide 'init-recentf)

