

;;list the repositories containing them
(setq package-archives '(
                         ;;("gnu" . "http://elpa.gnu.org/packages/")
                         ("gnu" . "http://elpa.zilongshanren.com/gnu/")
			 ;;("org" . "http://orgmode.org/elpa/")
			 ("org" . "http://elpa.zilongshanren.com/org/")
			 ;;("melpa" . "http://melpa.milkbox.net/packages/")
			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")
                         ;;("marmalade" . "http://marmalade-repo.org/packages/")
			 ("marmalade" . "http://elpa.zilongshanren.com/marmalade/")
			 ;;("elpa" . "http://tromey.com/elpa/")
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
