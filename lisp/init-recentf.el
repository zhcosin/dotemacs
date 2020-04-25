
(require 'recentf)
(require 'init-evil-leader)

(recentf-mode 1)

;; 设置 recentf-list 的最大长度
(setq recentf-max-saved-items 100)

;; 指定保存 .emacs.d/recentf 文件时使用的编码.
(setq recentf-save-file-coding-system 'utf-8)


(defvar-local selected-files nil)

(define-derived-mode select-file-mode special-mode "Select-Files"
  "mark/unmark files for select/unselect."
  
  (define-key select-file-mode-map (kbd "m")
    (lambda () (interactive)
      (let ((buffer-read-only nil))
        (save-restriction
          (narrow-to-region
            (line-beginning-position)
            (line-end-position))
	  (goto-char (point-min))
          (when (search-forward-regexp
                 "^\\(\\s-*-\\s-*\\)\\(\\[ \\]\\)\\(\\s-*\\)\\(.*\\)$" 
		 nil
                 t)
            (push
              (buffer-substring (match-beginning 4) (match-end 4))
              selected-files)
	    (replace-match "\\1[X]\\3\\4")
            (put-text-property
              (line-beginning-position)
              (line-end-position)
              'face 'highlight)
	  (goto-char (point-min)))))))

  (define-key select-file-mode-map (kbd "u")
    (lambda () (interactive)
      (let ((buffer-read-only nil))
        (save-restriction
          (narrow-to-region
            (line-beginning-position)
            (line-end-position))
	  (goto-char (point-min))
          (when (search-forward-regexp
                 "^\\(\\s-*-\\s-*\\)\\(\\[X\\]\\)\\(\\s-*\\)\\(.*\\)$" 
		 nil
                 t)
            (remove (buffer-substring (match-beginning 4) (match-end 4))
                      selected-files)
	    (replace-match "\\1[ ]\\3\\4")
            (put-text-property
              (line-beginning-position)
              (line-end-position)
              'face 'default)
	    (goto-char (point-min)))))))

  (define-key select-file-mode-map (kbd "x")
    (lambda () (interactive)
      (let ((file-list selected-files))
        (kill-buffer "*select file*")
        (dolist (file file-list)
          (find-file file)))))
  (define-key select-file-mode-map (kbd "n") (kbd "C-n"))
  (define-key select-file-mode-map (kbd "p") (kbd "C-p")))

(defun zhcosin/open-recent-files ()
  (interactive)
  (let ((file-list recentf-list))
    (switch-to-buffer "*select file*")
    (setq buffer-read-only nil)
    (erase-buffer)
    (insert "\n  recent files:\n\n")
    (dolist (file file-list)
      (insert " - [ ] " file "\n"))
    (goto-char (point-min))
    (setq selected-files nil)
    (select-file-mode)))

(add-to-list 'evil-emacs-state-modes 'select-file-mode)

(evil-leader/set-key
    "fr" 'zhcosin/open-recent-files)

(provide 'init-recentf)

