
(require 'ego)

(ego-add-to-alist 'ego-project-config-alist
               `(("zhcosin.github.io" ; 站点工程的名字
                 :repository-directory "F:/zhcosin.github.io" ; 站点的本地目录
                 :site-domain "http://zhcosin.github.io/" ; 站点的网址
                 :site-main-title "南下北上" ; 站点的标题
                 :site-sub-title "=============>从工具的奴隶到工具的主人" ; 站点的副标题
                 :theme (default) ; 使用的主题
                 :summary (("years" :year :updates 10) ("authors" :authors) ("tags" :tags)) ; 导航栏的设置，有 category 和 summary 两种
                 :source-browse-url ("Github" "https://github.com/zhcosin.github.io") ; 你的工程源代码所在的位置
                 ;;:personal-disqus-shortname "emacs-china" ; 使用 disqus 评论功能的话，它的短名称
                 ;;:personal-duoshuo-shortname "emacs-china" ; 使用 多说 评论功能的话，它的短名称
                 ;;:confound-email nil ; 是否保护邮件名称呢？t 是保护，nil 是不保护，默认是保护
                 :ignore-file-name-regexp "readme.org" ; 有些不想发布成 html 的 org 文件（但是又想被导入 git 进行管理），可以用这种正则表达的方式排除
                 :web-server-docroot "~/webRoot/zhcosin.github.io" ; 本地测试的目录
                 :web-server-port 5432); 本地测试的端口

                 ;; 你可以在此添加更多的站点设置
               ))

(provide 'init-ego)
