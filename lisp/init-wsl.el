;; emacs under wsl terminal share clipboard with windows 


(defun wsl-copy-region-to-clipboard (start end)
  "Copy region to Windows clipboard."
  (interactive "r")
  (call-process-region start end "clip.exe" nil 0))

(defun wsl-cut-region-to-clipboard (start end)
  (interactive "r")
  (call-process-region start end "clip.exe" nil 0)
  (kill-region start end))

(defun wsl-clipboard-to-string ()
  "Return Windows clipboard as string."
  (let ((coding-system-for-read 'dos))
(substring; remove added trailing \n
 (shell-command-to-string
  "powershell.exe -Command Get-Clipboard") 0 -1)))

(defun wsl-paste-from-clipboard (arg)
  "Insert Windows clipboard at point. With prefix ARG, also add to kill-ring"
  (interactive "P")
  (let ((clip (wsl-clipboard-to-string)))
(insert clip)
(if arg (kill-new clip))))

(define-key global-map (kbd "C-x C-y") 'wsl-paste-from-clipboard)
(define-key global-map (kbd "C-x M-w") 'wsl-copy-region-to-clipboard)
(define-key global-map (kbd "C-x C-w") 'wsl-cut-region-to-clipboard)



(provide 'init-wsl)
