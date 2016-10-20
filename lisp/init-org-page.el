(zhcosin/install-package-if-not-found 'org-page)

(require 'org-page)
(setq op/theme 'mdo)
(setq op/site-main-title "金榜除名")
(setq op/site-sub-title "七八个星天外，两三点雨山前。")
(setq op/repository-directory "~/zhcosin.github.io")
(setq op/personal-github-link "https://github.com/zhcosin")
;;(setq op/repository-directory "git@github.com:zhcosin/zhcosin.github.io.git")
;;(setq op/repository-directory "https://github.com/zhcosin/zhcosin.github.io.git")
(setq op/site-domain "http://zhcosin.github.io")
;;; for commenting, you can choose either disqus or duoshuo
;;(setq op/personal-disqus-shortname "your_disqus_shortname")
;;(setq op/personal-duoshuo-shortname "your_duoshuo_shortname")
;;; the configuration below are optional
;;(setq op/personal-google-analytics-id "your_google_analytics_id")

(provide 'init-org-page)
