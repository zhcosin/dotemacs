(zhcosin/install-package-if-not-found 'evil)
;; enable or disable evil mode.
;; if you want turn on/off evil mode when emacs is running,
;; you can use M-x turn-on-evil-mode or turn-off-evil-mode.

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
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
  (define-and-bind-text-object "i" "[^a-zA-Z0-9-_]" "[^a-zA-Z0-9-_]"))

(provide 'init-evil)
