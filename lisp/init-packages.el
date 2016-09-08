

;;list the repositories containing them
(setq package-archives '(
                         ("gnu" . "http://elpa.gnu.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("elpa" . "http://tromey.com/elpa/")
			 ))

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
	  (package-refresh-contents)
;;	  )
	(message "install package %s ..." pkg)
	(package-install pkg))
  )

(dolist (package zhcosin/packages)
  (zhcosin/install-package-if-not-found package))

(provide 'init-packages)
