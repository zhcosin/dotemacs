

;;list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

;;list the packages you want
(setq package-list '(evil smex desktop session company auctex popwin monokai-theme auctex))

(defvar zhcosin/packages '(
			   smex
			   desktop
			   session
			   window-number
			   popwin
			   monokai-theme
			   company
			   evil
			   smartparents
			   auctex
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
	(message "%s" "install package...")
	(package-install pkg))
  )

(dolist (package package-list)
  (zhcosin/install-package-if-not-found package))

(provide 'init-packages)
