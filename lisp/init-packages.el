
(defvar zhcosin/use-local-archives t)

(defvar zhcosin/local-archive (cons "myelpa" "~/myelpa"))
(defvar zhcosin/melpa-archive (cons "melpa" "http://melpa.milkbox.net/packages/"))
(defvar zhcosin/elpa-archive (cons "elpa" "http://tromey.com/elpa/"))
(defvar zhcosin/gnu-archive (cons "gnu" "http://elpa.gnu.org/packages/"))
(defvar zhcosin/org-archive (cons "org" "http://orgmode.org/elpa/"))
(defvar zhcosin/marmalade-archive (cons "marmalade" "http://marmalade-repo.org/packages/"))

(defvar zhcosin/local-archives '(
				 'zhcosin/local-archive
				 ))

(defvar zhcosin/net-archives '(
			       'zhcosin/melpa-archive
			       'zhcosin/elpa-archive
			       'zhcosin/gnu-archive
			       'zhcosin/org-archive
			       'zhcosin/marmalade-archive
			       ))

;;list the repositories containing them
(setq package-archives (if zhcosin/use-local-archives zhcosin/local-archives zhcosin/net-archives))

(defvar zhcosin/packages '(
			   ;; requires Emacs-24.3 or later versions.
			   helm
			   smex
			   desktop
			   session
			   window-number
			   popwin
			   monokai-theme
			   company
			   evil
			   ;;smartparents
			   magit
			   ;;ox-latex-chinese
			   auctex
			   company-auctex
			   org-page
			   ;;ego
			   flycheck
			   chinese-number
			   parinfer
			   helm-swoop
			   swiper-helm
			   ) "Default packages")

(setq package-selected-packages zhcosin/packages)

;;activate all the packages (in particular autoloads)
(package-initialize)

;;fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;;install the missing packages
;;(dolist (package package-list)
;;(unless (package-installed-p package)
;;(package-install package)))

(defun zhcosin/install-package-if-not-found(pkg)
  (unless (package-installed-p pkg)
    ;;	(when (need-refresh-contents)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents))
  ;;	  )
  (message "install package %s ..." pkg)
  (package-install pkg))

(provide 'init-packages)
