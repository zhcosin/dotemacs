(zhcosin/install-package-if-not-found 'evil)
;; enable or disable evil mode.
;; if you want turn on/off evil mode when emacs is running,
;; you can use M-x turn-on-evil-mode or turn-off-evil-mode.

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)  ;; fix issue TAB key not working in org-mode when emacs run in terminal, see https://stackoverflow.com/questions/22878668/emacs-org-mode-evil-mode-tab-key-not-working
  (setq evil-search-wrap nil)
  (setq evil-normal-state-cursor '("red" box))
  :config
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  (evil-mode t)

  ;; macro for define new text object and bind to key in visual mode,
  ;; if key is 'i', then press vii to select the text object at point.
  ;; code from: https://stackoverflow.com/questions/18102004/emacs-evil-mode-how-to-create-a-new-text-object-to-select-words-with-any-non-sp
  ;; thanks.
  (defmacro define-and-bind-text-object (key start-regex end-regex)
    (let ((inner-name (make-symbol "inner-name"))
          (outer-name (make-symbol "outer-name")))
      `(progn
         (evil-define-text-object ,inner-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count nil))
         (evil-define-text-object ,outer-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count t))
         (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
         (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

  ;; define text object for identify for program language,
  ;; press key vii to select the identify at point.
  (define-and-bind-text-object "i" "[^a-zA-Z0-9-_]" "[^a-zA-Z0-9-_]")
  
  ;; define text object for file path.
  ;; code from http://blog.binchen.org/posts/evil-text-object-to-select-nearby-file-path.html
  ;; thanks to chen bin.
  ;;
  ;; {{ nearby file path as text object,
  ;;      - "vif" to select only basename
  ;;      - "vaf" to select the full path
  ;;
  ;;  example: "/hello/world" "/test/back.exe"
  ;;               "C:hello\\hello\\world\\test.exe" "D:blah\\hello\\world\\base.exe"
  ;;
  ;; tweak evil-filepath-is-nonname to re-define a path
  (defun evil-filepath-is-separator-char (ch)
    "Check ascii table"
    (let (rlt)
      (if (or (= ch 47)
              (= ch 92))
          (setq rlt t))
      rlt))
  
  (defun evil-filepath-not-path-char (ch)
    "Check ascii table for charctater "
    (let (rlt)
      (if (or (and (<= 0 ch) (<= ch 32))
              (= ch 34) ; double quotes
              (= ch 39) ; single quote
              (= ch 40) ; (
              (= ch 41) ; )
              (= ch 60) ; <
              (= ch 62) ; >
              (= ch 91) ; [
              (= ch 93) ; ]
              (= ch 96) ; `
              (= ch 123) ; {
              (= ch 125) ; }
              (= 127 ch))
          (setq rlt t))
      rlt))
  
  (defun evil-filepath-char-not-placed-at-end-of-path (ch)
    (or (= 44 ch) ; ,
        (= 46 ch))) ; .
        
  
  (defun evil-filepath-calculate-path (b e)
    (let (rlt f)
      (when (and b e)
        (setq b (+ 1 b))
        (when (save-excursion
                  (goto-char e)
                  (setq f (evil-filepath-search-forward-char 'evil-filepath-is-separator-char t))
                  (and f (>= f b)))
          (setq rlt (list b (+ 1 f) (- e 1)))))
      rlt))
  
  (defun evil-filepath-get-path-already-inside ()
    (let (b e)
      (save-excursion
        (setq b (evil-filepath-search-forward-char 'evil-filepath-not-path-char t)))
      (save-excursion
        (setq e (evil-filepath-search-forward-char 'evil-filepath-not-path-char))
        (when e
          (goto-char (- e 1))
          ;; example: hello/world,
          (if (evil-filepath-char-not-placed-at-end-of-path (following-char))
              (setq e (- e 1)))))
          
      (evil-filepath-calculate-path b e)))
  
  (defun evil-filepath-search-forward-char (fn &optional backward)
    (let (found rlt (limit (if backward (point-min) (point-max))) out)
      (save-excursion
        (while (not out)
          ;; for the char, exit
          (if (setq found (apply fn (list (following-char))))
              (setq out t)
            ;; reach the limit, exit
            (if (= (point) limit)
                (setq out t)
              ;; keep moving
              (if backward (backward-char) (forward-char)))))
        (if found (setq rlt (point))))
      rlt))
  
  (defun evil-filepath-extract-region ()
    "Find the closest file path"
    (let (rlt b f1 f2)
  
      (if (and (not (evil-filepath-not-path-char (following-char)))
               (setq rlt (evil-filepath-get-path-already-inside)))
          ;; maybe (point) is in the middle of the path
          t
        ;; need search forward AND backward to find the right path
        (save-excursion
          ;; path in backward direction
          (when (setq b (evil-filepath-search-forward-char 'evil-filepath-is-separator-char t))
            (goto-char b)
            (setq f1 (evil-filepath-get-path-already-inside))))
        (save-excursion
          ;; path in forward direction
          (when (setq b (evil-filepath-search-forward-char 'evil-filepath-is-separator-char))
            (goto-char b)
            (setq f2 (evil-filepath-get-path-already-inside))))
        ;; pick one path as the final result
        (cond
         ((and f1 f2)
          (if (> (- (point) (nth 2 f1)) (- (nth 0 f2) (point)))
              (setq rlt f2)
            (setq rlt f1)))
         (f1
          (setq rlt f1))
         (f2
          (setq rlt f2))))
  
      rlt))
  
  (evil-define-text-object evil-filepath-inner-text-object (&optional count begin end type)
    "File name of nearby path"
    (let ((selected-region (evil-filepath-extract-region)))
      (if selected-region
          (evil-range (nth 1 selected-region) (nth 2 selected-region) :expanded t))))
  
  (evil-define-text-object evil-filepath-outer-text-object (&optional NUM begin end type)
    "Nearby path"
    (let ((selected-region (evil-filepath-extract-region)))
      (if selected-region
          (evil-range (car selected-region) (+ 1 (nth 2 selected-region)) type :expanded t))))
  
  (define-key evil-inner-text-objects-map "f" 'evil-filepath-inner-text-object)
  (define-key evil-outer-text-objects-map "f" 'evil-filepath-outer-text-object))
  ;; }}
  
(provide 'init-evil)
