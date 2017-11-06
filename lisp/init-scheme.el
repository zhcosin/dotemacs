
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun kh/add-hook (hooks funcs &optional append local)
  "More general definition of function add-hook."
  (unless (listp hooks)
    (setq hooks (list hooks)))
  (unless (listp funcs)
    (setq funcs (list funcs)))
  (dolist (hook hooks)
    (dolist (func funcs)
      (add-hook hook func append local))))

(require 'cmuscheme)

(defun kh/get-scheme-proc-create ()
  "Create one scheme process if no one is created."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name))))

(defun kh/scheme-send-last-sexp ()
  "A replacement of original `scheme-send-last-sexp':
1. check if scheme process exists, otherwise create one
2. make sure the frame is splitted into two windows, current one is the scheme
   source code window, the other one is the scheme process window
3. run `scheme-send-last-sexp'

PS: this function is inspired by Wang Yin."
  (interactive)
  (kh/get-scheme-proc-create)
  (cond ((= 2 (count-windows))
         (other-window 1)
         (unless (string= (buffer-name)
                          scheme-buffer)
           (switch-to-buffer scheme-buffer))
         (other-window 1))
        (t
         (delete-other-windows)
         (split-window-vertically (floor (* 0.68 (window-height))))
         (other-window 1)
         (switch-to-buffer scheme-buffer)
         (other-window 1)))
  (scheme-send-last-sexp))



;;; Always do syntax highlighting   
(global-font-lock-mode 1)   
;;; Also highlight parens   
(setq show-paren-delay 0  
how-paren-style 'parenthesis)   
(show-paren-mode 1)   
;;; This is the binary name of my scheme implementation   
;;(setq scheme-program-name "E:\\Racket\\Racket.exe")
;;(setq exec-path (append exec-path '("E:/Scheme48/Scheme48_1.9")))
(setq scheme-progname-map (make-hash-table)) 
(puthash 'gnu/linux' "/usr/bin/scheme48" scheme-progname-map)
(puthash 'windows-nt' "E:/Scheme48/Scheme48_1.9/scheme48.bat" scheme-progname-map)
(setq scheme-program-name (gethash system-type scheme-progname-map))

(kh/add-hook '(scheme-mode-hook)
             '((lambda ()
                 (local-set-key (kbd "C-x C-e") 'kh/scheme-send-last-sexp))))

(provide 'init-scheme)
