
(zhcosin/install-package-if-not-found 'youdao-dictionary)

(use-package youdao-dictionary
  :config
  (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+))

(provide 'init-youdao-dictionary)
